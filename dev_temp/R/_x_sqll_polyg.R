
# Do Not Include in 'iconr' package
# Function to download selected iconography from Pg
# called by iconr/R/__all.R

sqll.obj.root <- "SELECT site, numero, img FROM objets"

### to WKT
## Nodes
# POINTS / geom
sqll.ug.pts.root <- "
  SELECT
  objets.site,
  objets.numero,
  table_noeuds.id,
  table_noeuds.type,
  table_noeuds.technologie as technlg,
  table_noeuds.incomplet as incmplt,
  ST_AsText(table_noeuds.geom) as wkt FROM objets LEFT JOIN table_noeuds
ON table_noeuds.site = objets.site AND table_noeuds.decor = objets.numero
  "
# LINES / geom_outlines_opn
sqll.ug.lines.root <- "
  SELECT
  objets.site,
  objets.numero,
  table_noeuds.id,
  table_noeuds.type,
  table_noeuds.technologie as technlg,
  table_noeuds.incomplet as incmplt,
  ST_AsText(table_noeuds.geom_outlines_opn) as wkt FROM objets LEFT JOIN table_noeuds
ON table_noeuds.site = objets.site AND table_noeuds.decor = objets.numero
  "

# POLYGON / geom_shape
sqll.ug.polyg.root <- "
  SELECT
  objets.site,
  objets.numero,
  table_noeuds.id,
  table_noeuds.type,
  table_noeuds.technologie as technlg,
  table_noeuds.incomplet as incmplt,
  ST_AsText(table_noeuds.geom_shape) as wkt FROM objets LEFT JOIN table_noeuds
ON table_noeuds.site = objets.site AND table_noeuds.decor = objets.numero
  "

## Edges
sqll.edges.root <- "
  SELECT
  objets.site,
  objets.numero,
  table_liens.a,
  table_liens.b,
  table_liens.typ,
  ST_AsText(table_liens.geom) as wkt FROM objets LEFT JOIN table_liens
ON table_liens.site = objets.site AND table_liens.decor = objets.numero
  "
# add condition(s)
cond.sqll <- "WHERE (objets.site LIKE 'Ain Ghazal' and objets.numero LIKE 'stat_2_gref')"
cond.sqll <- paste0(cond.sqll,
                    " OR (objets.site LIKE 'Ain Ghazal' and objets.numero LIKE 'stat_5_gref')")
cond.sqll <- paste0(cond.sqll,
                    " OR (objets.site LIKE 'Qarassa' and objets.numero LIKE 'figurine__wx')")
cond.sqll <- paste0(cond.sqll,
                    " OR (objets.site LIKE 'Jericho' and objets.numero LIKE 'tete_afe_gref')")
cond.sqll <- paste0(cond.sqll,
                    " OR (objets.site LIKE 'Kfar Hahoresh' and objets.numero LIKE 'crane_afg')")

sqll.obj. <- paste(sqll.obj.root, cond.sqll)
sqll.ug.pts. <- paste(sqll.ug.pts.root, cond.sqll)
sqll.ug.lines. <- paste(sqll.ug.lines.root, cond.sqll)
sqll.ug.polyg. <- paste(sqll.ug.polyg.root, cond.sqll)
sqll.edges. <- paste(sqll.edges.root, cond.sqll)
