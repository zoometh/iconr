# Table of Contents
1. [_iconr_ 0.1.0](#v1)
3. [Collaborations](#col)
4. [Collaborators](#collab)


# 1. _iconr_ 0.1.0

## publishing

### briefing notes

  - [ ] [Bulletin de la Société Préhistorique Française - Actualités (*scientific news*)](https://www.jstor.org/journal/bullsociprehfran)

  - [ ] [INORA newsletter](https://www.icomos.org/en/resources/publicationall/165-articles-en-francais/centre-de-documentation/557-inora-international-newsletter-on-rock-art) (NOT SURE IT STILL PUBLISH)
  
### communications in congress

  - [x] 2021 [CAA congress](https://2021.caaconference.org/sessions/)
    - [x] [S17. Tools for the Revolution: developing packages for scientific programming in archaeology (Standard)](https://2021.caaconference.org/sessions/#17)
  - [x] 2021 [EAA congress](https://eaa.klinkhamergroup.com/eaa2021/)
    - [x] Between Variability and Singularity: Crossing Theoretical, Qualitative and Computer-based Approaches to Types and Typologies in Archaeology [PaM]
    - [x] Human Visual Archives, Globally. Materials, Forms and Meanings of Human Representations in Ancient Times
  - [ ] 2022 [WAC congress](https://www.wac-9.org/sessions/) (TOO EXPENSIVE FEES)
  - [ ] 2023 [AURA Congress](http://www.ifrao.com/the-aura-congress/)


### Papers in scientific reviews

#### IT and Methods

  - [x] 2021 [JOSS](https://github.com/zoometh/iconr/blob/master/paper.md) 
  - [ ] [JSS](https://raw.githubusercontent.com/zoometh/jss_iconr/main/article_rvTH17.pdf)
    - [draft](https://raw.githubusercontent.com/zoometh/jss_iconr/main/article_rvTH17.pdf) 
  
#### Prehistorical issues

  - [ ] [JAMT](https://www.springer.com/journal/10816) 

  
# 2. Collaborations

[Users/collaborators](#collab) should be specialists on any consensual group of decorations (Paleolithic rock-art, Iron Age stelae, etc.). We will: 

a. [inform](#info) them  
b. propose a [master class](#col.mc)  
c. propose different [training(s)](#col.mc)  
d. propose a [congress session/round-table](#col.rt)  
e. work to get a [publication](#pub.col)  

## A. Information {#info}

contact mail and schedule a [master class](#col.mc)

***
**mail subject**:  

R package _iconr_ - An open source computer-based method to study ancient iconography 

**mail body**:  

Dear Colleague,  

We have the pleasure to introduce you the first version of the R package  [***iconr***](https://github.com/zoometh/iconr#readme). 

The ***iconr*** package is dedicated to Prehistoric iconography modeling and analysis. Grounded on graph theory and spatial analysis, it aims to offer concepts and functions for a greater normalization of quantitative analysis, to facilitate cross-cultural comparisons. The main principle of the package is to consider any iconographic composition (here, 'decoration') as a geometric graph of graphical units. Geometric graphs -- also known as planar graphs or spatialized graphs -- allow to model the neighborhood of these graphical units which are the fundamental relationships of visual semiotics.

<p align="center">
  <img alt="img-name" src="docs/man/figures/edges_compar.png" width="600">
  <br>
    <em>same edges identification</em>
</p>


The first version of the package has been recently uploaded to the [CRAN]((https://cran.r-project.org/web/packages/iconr/index.html)). A brief description of the package has been published on the [_Journal of Open Statistical Software_](https://joss.theoj.org/papers/10.21105/joss.03191) (attached here), and online documentation is already available:

  + [package description](https://zoometh.github.io/iconr/articles/index.html)
  + [GIS use for data entry](https://zoometh.github.io/iconr/articles/gis.html)
  + [interactive examples](https://zoometh.github.io/iconr/articles/shiny.html)
  + [training datasets](https://zoometh.github.io/iconr/articles/examples.html)

The next ***iconr*** release will integrate shape analysis of graphical units, tree-like structures for graphical units thesaurus (multi-linguism & shared vocabularies), use of directed acyclic graphs (DAG) to model the graphical units' superimpositions (ie, Harris matrix).
  
To promote the package utilization, we have schedule a first presentation on ZOOM (duration: ca. 45 minutes), the **xx/xx/xx at 16:00 UTC**. During the presentation, We will explain how it works and what are the expected outcomes (40 minutes) and respond to the audience questions (5 minutes). We will be very happy to meet you at this moment. If you are interested to participate, please conserve the following information

```
Topic: iconr R package - masterclass
Time: xxx

Join Zoom Meeting
https://xxx

Meeting ID: xxx
Passcode: xxx
```
  
If you cannot be present, but you are interested by the package or the presentation, thank you for letting us know. The presentation will be recorded and available on a video platform.  

Best regards,

Thomas Huet, LabEx ARCHIMEDE ANR-11-LABX-0032-01   
Jose M Pozo, Independant researcher  
Craig Alexander, Independant researcher  

***

## B. Masterclass

Online masterclass to present the _iconr_ package and schedule [training(s)](#col.mc) (open dates with Doodle)

1. Geometric graph heuristic

2. Graph analysis indexes (degrees, same edges, etc.)

3. Case studies

## C. Training

### C.1. R and RStudio basic knowledge

Tutorial on R and RStudio install and basic functions

### C.2. Data entry through a GIS

1. Create graph decorations on GIS

### C.3. _iconr_ package

Datasets presentations/Training to use the _iconr_ package:

1. Read, plot and compare graph decorations

2. Further analysis

* schedule [congress session/round-table](#col.rt) (open dates with Doodle)

* open a GitHub forum for FAQs and scientific exchanges

## D. round-table

After the [training](#col.tr), people are supposed to have used *iconr* on their favorite dataset (i.e. a selection of decorations). We will propose them to present their results in an oral communication in the frame of a round-table. Depending on the size of the decoration they have proceed, each used could choose between:

1. **3 + decorations**: qualitative analysis
2. **7 +decorations**: semi-quantitative analysis (ie. rank-based, non-parametric tests: Mann-Withney, Spearman, etc.)
3. **30 + decorations**: quantitative analysis (ie. mean-based, parametric tests: Shapiro-Wilk, Student, etc.)

The aim of the round-table is to find the appropriate way to compare heterogeneous decorative contents (by periods, families, themes, techniques, etc.)

<p align="center">
  <img alt="img-name" src="doc/img/famille_thm.png" width="500">
  <br>
    <em>families x themes</em>
</p>

see: [families examples](https://zoometh.github.io/iconr/articles/shiny.html)


## E. publication {#pub.col}

  - [ ] [JAMT](https://www.springer.com/journal/10816) 
  - [ ] [Adoranten](https://www.rockartscandinavia.com/adoranten-vv4.php)

# Collaborators {#collab}

Identify who will be our next collaborators

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
   
