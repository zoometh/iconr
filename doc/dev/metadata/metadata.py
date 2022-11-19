import os
import pandas as pd
from iptcinfo3 import IPTCInfo
from exif import Image

# from PIL.ExifTags import TAGS
# df = pd.DataFrame(columns=["Name", "Creator", "Rights", "Title", "Description", "Credit", "Date", "Contact", "Subject", "Model", "Lens"])

pathIn = 'C:/Rprojects/iconr/doc/dev/'
df_file = "steles_metadata.xlsx"
df_tags = pd.read_excel(f'{pathIn}/{df_file}')
df = pd.DataFrame(df_tags, columns = ['site', 'decor', 'artist', 'datetime', 'imagedescription'])

for i in range(len(df.index)):
    # get IPTC/EXIF values
    site = df.at[i, "site"]
    decor = df.at[i, "decor"]
    Artist = df.at[i, "Artist"]
    DateTime = df.at[i, "DateTime"]
    ImageDescription = df.at[i, "ImageDescription"]
    keywords = df.at[i, "keywords"]
    # open the image
    print(str(i) + ") read folder: " + site)
    a_img = f'{pathIn}/{site}/{decor}'
    print("   read image: " + f'{site}/{decor}')
    with open(a_img, 'rb') as img_file:
        img = Image(img_file)
    # add IPTC/EXIF values
    img.artist = artist
    img.datetime = datetime
    img.imagedescription = imagedescription

# import pyexiv2
# metadata = pyexiv2.ImageMetadata()

from PIL import Image
import piexif

# a_img = f'{pathIn}/{site}/{decor}'
# im = Image.open(a_img)
# exif_dict = piexif.load(im.info["exif"])
exif_dict = piexif.load(f'{pathIn}/{site}/{decor}')
for tag in exif_dict["Exif"]:
    print(piexif.TAGS[ifd][tag]["name"], exif_dict[ifd][tag])

exif_ifd = {piexif.ExifIFD.Artist: Artist,
            piexif.ExifIFD.DateTime: DateTime,
            piexif.ExifIFD.DateTime: ImageDescription,
            }
exif_dict = {"Exif": exif_ifd}
exif_bytes = piexif.dump(exif_dict)
piexif.insert(exif_bytes, f'{pathIn}/{site}/{decor}')


# IPTC
info = IPTCInfo(f'{pathIn}/{site}/{decor}')
info['caption/abstract'] = 'Witty caption here'
info['supplemental category'] = ['portrait']
info['Keywords'] = ['keyword1', 'keyword2']
info['capdd'] = 'Wdede'
