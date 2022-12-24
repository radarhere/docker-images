import io
import warnings
from PIL import Image, ImageFile, ImageFilter
from memory_profiler import profile

print(Image.__version__)

def enable_decompressionbomb_error():
    ImageFile.LOAD_TRUNCATED_IMAGES = True
    warnings.filterwarnings("ignore")
    warnings.simplefilter("error", Image.DecompressionBombWarning)

@profile
def fuzz_image(data):
    with Image.open(io.BytesIO(data)) as im:
        im.rotate(45)
        im.filter(ImageFilter.DETAIL)
        im.save(io.BytesIO(), "BMP")

enable_decompressionbomb_error()
with open("cluster19.gif", "rb") as fp:
    fuzz_image(fp.read())
