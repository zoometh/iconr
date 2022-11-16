# Do Not Include in 'iconr' package
# Function to download selected iconography from Pg to iconr format
# called by iconr/R/__all.R

sqll.obj.root <- "SELECT site, numero, img FROM objets"

## Nodes
# POINTS / geom
sqll.ug.pts.root <- "
  SELECT
  objets.site,
  objets.numero as decor,
  table_noeuds.id,
  table_noeuds.type,
  table_noeuds.technologie as technlg,
  table_noeuds.incomplet as incmplt,
  ST_X(table_noeuds.geom) as x,
  ST_Y(table_noeuds.geom) as y FROM objets LEFT JOIN table_noeuds
ON table_noeuds.site = objets.site AND table_noeuds.decor = objets.numero
  "

## Edges
sqll.edges.root <- "
  SELECT
  objets.site,
  objets.numero as decor,
  table_liens.a,
  table_liens.b,
  table_liens.typ as type FROM objets LEFT JOIN table_liens
ON table_liens.site = objets.site AND table_liens.decor = objets.numero
  "
# add condition(s)
cond.sqll <- "WHERE (objets.site LIKE 'Catal Huyuk' and objets.numero LIKE 'p_taureau_rouge_aeh')"

sqll.obj. <- paste(sqll.obj.root, cond.sqll)
sqll.ug.pts. <- paste(sqll.ug.pts.root, cond.sqll)
sqll.edges. <- paste(sqll.edges.root, cond.sqll)
