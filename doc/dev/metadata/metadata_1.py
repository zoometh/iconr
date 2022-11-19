import os
import pandas as pd
from iptcinfo3 import IPTCInfo

pathIn = 'C:/Rprojects/iconr/doc/dev/metadata/'
df_file = "steles_metadata.xlsx"
df_tags = pd.read_excel(f'{pathIn}/{df_file}')
df = pd.DataFrame(df_tags)

for i in range(len(df.index)):
    # get IPTC values
    site = df.at[i, "site"]
    decor = df.at[i, "decor"]
    credit = df.at[i, "credit"]
    date = df.at[i, "date created"]
    caption = df.at[i, "caption"]
    source = df.at[i, "source"]
    keywords = df.at[i, "keywords"]
    # open the image
    print(str(i) + ") read folder: " + site)
    a_img = f'{pathIn}/{site}/{decor}'
    print("        - read image: " + f'{site}/{decor}')
    ## add IPTC values
    img = IPTCInfo(f'{pathIn}/{site}/{decor}')
    img['object name'] = site + "." + decor
    img['credit'] = credit
    img['date created'] = date
    img['caption/abstract'] = caption
    img['source'] = source
    img['Keywords'] = keywords.split(";") 
    img.save()
    print("        - saved")
