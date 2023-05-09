**Nume: Carauleanu Valentin Gabriel**
**Grupă: 311CA**

## Tema 1 - Metode Numerice

### Descriere:

* Markov-is-coming
    * implementarea programului are la baza matrice sparse
    * din acest motiv, am utilizat functii specifice precum nnz sau find pentru a
    localiza elementele nenule din matricele si vectorii utilizati
    * nefiind permisa functia dlmread, date au fost citite pe linii, ulterior fiind
    despartite prin functia strsplit

* linear-regression
    * toate date sunt citite similar citirii de la Markov-is-coming,
    matricele fiind citite pe linii, apoi sparte in elementele componente
    * pentru a crea matricea utilizata de functia de regresie, vom parcurge InitalMatrix
    pe coloane testand primul element pentru a deduce ce tip de coloana este: 
    numerica, 'yes/no' sau 'furnished'
    * ulterior cream noua coloana prin intermediul functiei strcmp
    * in cadrul functiei normal_equation testam daca matricea este pozitiv definita prin
    intermediul valorilor proprii, iar ulterior o parsam sau nu functiei de gradient

* mnist-101
    * functia de load_dataset foloseste faptul ca fisierul de input este un fisier.mat,
    incarcand datele in memorie
    * pentru a initializa greutatile ne vom folosi de o scalare a unei matrice rezultata in urma
    rand(), deoarece avem nevoie de elemente in intervalul Lprev, Lnext
    * primind time-out de n ori la cost_function si predict_classes, am folosit forma matriceala pentru
    forward propagation
    * de asemenea, am vectorizat toate operatiile pentru o mai buna eficienta timp
    