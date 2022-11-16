# TODO:
# group eye + eye -> eye, by decor
# add this pat to nds_morph_compar & classif

fac.type <- fac[fac$type == a.gu.type.name, ]
fac.type$idf <- as.factor(fac.type$idf)
a.gu.type <- Out(coo, fac.type)
# loop through decor to group same types (eg. eye, eye)
# filter on site, decor, group on decor
for(a.gu.type.dec in unique(a.gu.type$idf)){
  # a.gu.type.dec <- "Madonna delle Grazie.item7"
  coo.mean <- Momocs::filter(a.gu.type, idf == a.gu.type.dec)
  # panel(coo.mean) # show before mean
  ef.type <- efourier(coo.mean, nb.h=10)
  ef.type.mean <- ef.type %>% MSHAPES() # mean shape
  ef.type.mean %>% coo_plot()
  # ef.type %>% MSHAPES() %>% coo_plot()
}


ww <-

www <- Momocs::filter(a.ug.type, a.ug.type$idf == "Capanna Longo.vsg_yp")
class(www)

ef.type <- efourier(a.gu.type, 10)
efi <- efourier_i(ef.type)

