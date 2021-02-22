# Table of Contents
1. [_iconr_ 0.1.0](#v1)
2. [Next developments](#v2)
3. [Collaborations](#col)
4. [Collaborators](#collab)


# 1. _iconr_ 0.1.0 {#v1}

## documentation

  - [ ] Spell checking, remove glitches, etc., of the [vignettes](https://zoometh.github.io/iconr)
  
## publishing {#pub}

### briefing notes

  - [ ] [Bulletin de la Société Préhistorique Française - Actualités (*scientific news*)](https://www.jstor.org/journal/bullsociprehfran)

  - [ ] [INORA newsletter](https://www.icomos.org/en/resources/publicationall/165-articles-en-francais/centre-de-documentation/557-inora-international-newsletter-on-rock-art) (NOT SURE IT STILL PUBLISH)
  
### communications in congress

  - [ ] 2021 [CAA congress](https://2021.caaconference.org/sessions/)
    - [ ] [S17. Tools for the Revolution: developing packages for scientific programming in archaeology (Standard)](https://2021.caaconference.org/sessions/#17)
  - [ ] 2022 [WAC congress](https://www.wac-9.org/sessions/)


### Papers in scientific reviews

#### IT and Methods

  - [ ] [JSS](https://raw.githubusercontent.com/zoometh/jss_iconr/main/article_rvTH17.pdf) 
  
#### Prehistorical issues

  - [ ] [JAMT](https://www.springer.com/journal/10816) 

  
# 2. next developments (_iconr_ 0.2.0) {#v2}

    
## Work groups {#v2.wg}

Define work groups

  - [ ] [Shape analysis](#v2.wg)  

  - [ ] [Typology](#v2.wg.th)  

  - [ ] [Harris Matrix](#v2.wg.hm) 

### Shape analysis {#v2.wg.sa}

Perform shape analysis on GUs

ex: [ex1](https://zoometh.github.io/iconr/articles/next.html#shape-analysis-1)  

### Thesaurus {#v2.wg.th}

Create hierarchical _thesaurus_ for:

* GUs' typologies
* GUs' techniques
* etc.

ex: [ex1](https://zoometh.github.io/iconr/articles/next.html#typology-1),  [ex2](https://github.com/zoometh/iconr/blob/master/doc/img/typology_gu.png)

### Harris Matrix {#v2.wg.hm}

Perform Harris matrices for GUs

ex: [ex1](https://zoometh.github.io/iconr/articles/next.html#harris-matrix-1)  

#### Collaborators

  - [ ] [Joe Roe](https://joeroe.io/): [DAGs](https://stratigraphr.joeroe.io/articles/stratigraph.html) for GUs stratigraphy

## Papers in scientific reviews

  - [ ] [JOSS](https://joss.theoj.org/)

# 3. Collaborations {#col}

[Users/collaborators](#collab) should be specialists on any consensual group of decorations (Paleolithic rock-art, Iron Age stelae, etc.). We will: 

a. [inform](#info) them 
b. propose a [master class](#col.mc)
c. propose different [training(s)](#col.mc)
d. propose a [congress session/round-table](#col.rt)
e. work to get a [publication](#pub.col).

## a. information {#info}

* contact mail and schedule a [master class](#col.mc)


***
**mail subject**:  

A new opensource computer-based method to study ancient iconography - R package

**mail body**:  

Dear Colleague,  

We would like to inform you that the [_iconr_ R package](https://zoometh.github.io/iconr/), dedicated to ancient iconography analysis, has been recently uploaded to the CRAN.  

This package is grounded in graph theory and spatial analysis to offer concepts and functions for modeling Prehistoric iconographic compositions and preparing for further analysis (clustering, typology tree, Harris diagram, etc.). The package purpose is to contribute to cross-cultural comparison through a greater normalization of quantitative analysis.

<p align="center">
  <img alt="img-name" src="man/figures/solana_256colours.png" width="700">
  <br>
    <em>families x themes</em>
</p>
  
  
In order to let people know how the package works, we will schedule a first ZOOM **master class** (duration: 45 minutes), the xx/xx/xx at 16:00 UTC. Please conserve the following informations

```
Topic: iconr R package - masterclass
Time: Mar 9, 2021 12:00 PM Paris

Join Zoom Meeting
https://us04web.zoom.us/j/79675438246?pwd=VjdFbUozN0ZrcExKaWIyTXhiczhJUT09

Meeting ID: 796 7543 8246
Passcode: FHW6fN
```
  
We will be very happy to meet you at the master class. If you cannot be present, but you are interested by the method, the master class will be recorded and available on a video platform. We will let you know.  

Best regards,

Thomas Huet
Jose M Pozo
Craig Alexander

***

## b. masterclass {#col.mc}

Online masterclass to present the _iconr_ package and schedule [training(s)](#col.mc) (open dates with Doodle)

1. Geometric graph heuristic

2. Graph analysis indexes (degrees, same edges, etc.)

3. Case studies

## c. training {#col.tr}

### c1. R and RStudio basic knowledge

Tutorial on R and RStudio install and basic functions

### c2. _iconr_ package

Datasets presentations/Training to use the _iconr_ package:

1. Create graph decorations on GIS

2. Plot and compare graph decorations

3. Further analysis

* schedule [congress session/round-table](#col.rt) (open dates with Doodle)
* open a GitHub forum for FAQs and scientific exchanges

## d. congress session/round-table {#col.rt}

Results presentations. Ask scholars and specialists to draw graphs on a selection of decoration. Decorative contents will be addressed and compare by periods, families, themes and techniques

<p align="center">
  <img alt="img-name" src="doc/img/famille_thm.png" width="500">
  <br>
    <em>families x themes</em>
</p>

see: [families examples](https://zoometh.github.io/iconr/articles/shiny.html)

### datasets

Each collaborator could choose between

1. **3 or more decorations**: qualitative analysis

2. **7 or more decorations**: semi-quantitative analysis (ie. rank-based, non-parametric tests: Mann-Withney, Spearman, etc.)

3. **30 or more decorations**: quantitative analysis (ie. mean-based, parametric tests: Shapiro-Wilk, Student, etc.)

### congresses

2023 [AURA Congress](http://www.ifrao.com/the-aura-congress/)

## e. publication {#pub.col}

  - [ ] [JAMT](https://www.springer.com/journal/10816) 

# Collaborators {#collab}


## By families {#fam}

  - [ ] Palaeolithic cave rock-art: 
    - France: 
      - [ ] [Julien Monney](http://theses.fr/184904846)
    - Spain: 
      - [ ] [Aitor Ruiz-Redondo](https://southampton.academia.edu/AitorRuizRedondo)
    
  - [ ] Palaeolithic portable art: ...
  
  - [ ] Azilian painted peebles: ...
  
  - [ ] Near East PPNB painting: ...
  
  - [ ] Early Neolithic anthromorph potteries:
    - [ ] [Johanna Recchia](https://www.theses.fr/236657178)
    
  - [ ] Sahara rock-art
    - [ ] [Fatima Zohra Khaled](http://www.theses.fr/2015MON30070)
    
  - [ ] Levantine/Macro-Schematic rock-art: 
    - [ ] Ines Domingo Sanz
    - [ ] Esther Lopez-Montalvo
    
  - [ ] Chalcolithic stelae (Rouergue, Provence, Languedoc): 
    - [ ] [Jules Masson Mourey](http://www.theses.fr/s163490)
    
  - [ ] Schematic rock-art: 
    - France: 
      - [ ] [Claudia Desfrasne](https://lampea.cnrs.fr/spip.php?article3640)
    - Spain: ...
    
  - [ ] Cups-and-rings: 
    - Bretagne: 
      - [ ] Serge Cassen
    - Galicia (`PENA TU`, etc.): ...
    - Great Britain: 
      - [ ] Guillaume Robin
      - [ ] Aron Mazel
      - [ ] Marta Diaz-Guardamino 
    
  - [ ] Scandinavian rock-art:
    - [ ] [Johan Ling](https://www.ancientportsantiques.com/wp-content/uploads/Documents/PLACES/UK-EUNorth/CopperScandinavia-Ling2015.pdf)
    - [ ] [Nimura, Courtney](https://www.researchgate.net/publication/305391767_Rock_art_and_coastal_change_in_Bronze_Age_Scandinavia/figures?lo=1)
    - [ ] [Gjerde J.](https://munin.uit.no/bitstream/handle/10037/2741/401-506gjerde-thesis-5.pdf?sequence=8&isAllowed=y)
  
  - [ ] Mycenian potteries with figurative decorations: ...
  
  - [ ] Warrior Stelae: 
    - [ ] Pierre-Yves Milcent
    - [ ] Marta Diaz-Guardamino
  
  - [ ] Mailhac potteries with figurative decorations:
    - [ ] Gomes de Soto
  
  - [ ] First Iron Age potteries with figurative decorations (Sopron, Darslup, etc.)
    - [ ] Christian Huth
  
  - [ ] Second Iron Age "bas aragon" stelae (`STELE BAS ARAGON`, etc.): ///
    
## By sites

  - [ ] Mount Bego: 
    - [ ] Nicoletta Bianchi
  - [ ] Valcamonica (`VALCAMONICA`):
    - [ ] Alberto Marretta
    - [ ] Andrea Arca
    - [ ] Paolo Rondini
  - [ ] Morro du Chapéu: ...
    
## By geographical areas
 
  - [ ] Australian arborigen rock-art:
    - [ ] Ines Domingo Sanz
  - [ ] South African San rock-art: 
    - [ ] Aron Mazel
  - [ ] Australian churingas: ...
  - [ ] Tihuanacu potteries with figurative decorations: ...
  - [ ] Aztec codex: ...
  - [ ] Native Americans sustaining memory paintings (e.g. Dakota Bible): ...
  
## By themes

 - [ ] "Mappe di pietra":
   - [ ] Andrea Arca
   
