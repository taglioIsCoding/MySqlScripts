# Supermercato

### Consegna 
 Con la conclusione dell’anno solare è necessario effettuare l’inventario dei prodotti e delle quantità presenti nell’attività e ciò comporta la chiusura della stessa per un certo numero di giorni. Per ridurre al minimo questa chiusura, la proprietà ha deciso di investire nel miglioramento della tecnologia per effettuare tale operazione. Per conoscere il tipo di ?_prodotto_, numero di confezioni presenti in esposizione e magazzino. In questo modo potrà far partire l’ordinazione per il prossimo anno. Si consideri che i prodotti sono esposti in ordine, uno dietro l’altro in modo da semplificare il conteggio. La realtà è quella di un grosso supermercato (300 mq). 

 Il candidato analizzi la realtà di riferimento e, fatte le opportune ipotesi aggiuntive, individui una soluzione che a suo motivato giudizio sia la più idonea per sviluppare i seguenti punti:
  1. il progetto della base di dati per la gestione delle informazioni al      fine di produrre l’inventario finale: in particolare si richiede il       modello concettuale e il corrispondente modello logico. 
  2. la codifica in linguaggio SQL delle seguenti interrogazioni: 
    a) la quantità di un determinato prodotto presente in ogni supermercato;b) Nome del supermercato e del relativo prodotto presente in magazzino    in quantità maggiore di un numero prefissato. 
    c) Il nome del supermercato con il minor numero di prodotti presenti in    esposizione 
  3. il candidato codifichi una pagina web utilizzando linguaggi a     sua     scelta per visualizzare l’elenco dei supermercati.

### Analisi
 Dopo aver letto il testo io e i miei compagni abbiamo fatto alcune valutazioni sul problema dato. 
 Abbiamo identificato l'entità *Prodotto* con diversi attributi, cosi facendo un impiegato responsabile degli ordini può controllare tutti i prodotti che vengono venduti all'interno di tutta la catena.
 Un prodotto sarà poi posto all'interno di una e una sola *Categoria*. Abbiamo creato questa tabella per questioni di normalizzazione.
 In seguito abbiamo trovato l'entità *Supermercato* indentificata tramite un ID univoco e una serie di alti attributi.
 Abbiamo collegato poi la tabella Prodotto alla tabella Supermercato tramite la relazione *Possedere* di cardinalità NN infatti più prodotti sono contenuti all'interno di un supermercato e più supermercari hanno lo stesso prodotto. Attributi di possedere saranno il numero di confezioni del determinato prodotto all'interno del supermercato o all'intreno del magazzino.


#### ERD

  ![E/R](https://github.com/taglioIsCoding/MySqlScripts/blob/master/Supermarket/ERD.PNG)

### Logic model

Supermercati(*IdSuper*, NumCivico, Citta, Via);
Prodotti(*IdProdotto*, Nome, Prezzo, _IdCategoria_);
Possedere(*_IdProdotto_*, *_IdSuper_*, NumConfM, NumConfE, ;
Categorie(*IdCategoria*, Descrizione);

