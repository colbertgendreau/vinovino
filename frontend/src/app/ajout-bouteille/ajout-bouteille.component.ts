import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';
// import {FormControl} from '@angular/forms';
// import {Observable} from 'rxjs';
import { IBouteille } from '../ibouteille';
import { FetchService } from '../fetch.service';
import { FormBuilder, FormGroup, FormControl, Validators } from '@angular/forms';
import { Imesbouteilles } from '../imesbouteilles';
import { ActivatedRoute } from '@angular/router';
import { MatSnackBar, MatSnackBarConfig } from '@angular/material/snack-bar';
import { Ibouteillecellier } from '../ibouteille-cellier';
import { ICellier } from '../icellier';
import { ScannerComponent } from '../scanner/scanner.component';


// User interface
export class User {
  name: any;
  email: any;
}

@Component({
  selector: 'app-ajout-bouteille',
  templateUrl: './ajout-bouteille.component.html',
  styleUrls: ['./ajout-bouteille.component.scss']
})

export class AjoutBouteilleComponent implements OnInit {

  isSignedIn!: boolean;

  UserProfile!: User;
  arrayBouteille: Array<IBouteille>;
  filteredData: any = [];
  searchTerm: any = '';
  selectedData: any = [];
  ajouterBouteilleForm: FormGroup;
  bouteille: IBouteille;
  nouvelleBouteille: Imesbouteilles;
  isDataSelected: boolean;
  bouteilles: Array<Ibouteillecellier>;
  bouteillePlusUn: Imesbouteilles;
  scannedBouteille: any;
  messageErreur: string = '';
  choixPays: string[] = ['Autre', 'Afrique du Sud', 'Allemagne', 'Argentine', 'Arménie', 'Australie', 'Autriche', 'Bulgarie', 'Brésil', 'Canada', 
                          'Chili', 'Chine', 'Croatie', 'Espagne', 'États-Unis', 'France', 'Géorgie', 'Grèce', 'Hongrie', 'Israël', 'Italie', 'Liban', 
                          'Luxembourg', 'Maroc', 'Mexique', 'Moldavie', 'Nouvelle-Zélande', 'Portugal', 'République Tchèque', 'Roumanie', 'Slovénie', 'Suisse', 'Uruguay'
                        ];
  listeCelliers: Array<ICellier>;
  idCellierUrl: any = 'n';
  spin: boolean;
  hide: boolean;
  hideForm: boolean = false;
  present: boolean;
  quantite: number;

  formSubmitted = false;



  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService,
    public authService: AuthService,
    public fetchService: FetchService,
    private formBuilder: FormBuilder,
    private route: ActivatedRoute,
    private snackBar: MatSnackBar
  ) {
    this.listeCelliers = [];
    this.idCellierUrl = 'n';
    this.authService.profileUser().subscribe((data: any) => {
      this.UserProfile = data;
      console.log(this.UserProfile);
    });

    this.arrayBouteille = [];

  }

  /**
   * fait la recherche dans le array de toute les bouteille de la saq
   * @param searchTerm mot rentrer par le user pour la recherche
   */
  filterData(searchTerm: string) {
    this.clearForm();
    this.hideForm = false;
    if (searchTerm.length < 3) {
      this.filteredData = [];
    } else {
      this.spin = true;

      if (this.searchTerm === '') {
        this.filteredData = [];
      } else {
        this.spin = true;
        this.hide = true;
        this.hideForm = true;

        this.filteredData = this.arrayBouteille.filter(item =>
          item.nom.toLowerCase().includes(searchTerm.toLowerCase())
        );
      }
      this.spin = false;
      this.hide = false;
    }
  }

  /**
   * si la recherche trouve une bouteille avec le searchTerm rentrer par le user
   * @param bouteille data de la bouteille trouver
   * on patch les data de bouteille dans le form ajouter
   */
  selectData(bouteille: any) {

    window.scrollTo(0, 0);

    window.scroll({ // pour scroll down quand on clique sur une bouteille
      top: 300,
      left: 0,
      behavior: 'smooth'
    });

    this.hideForm = false;
    this.selectedData = bouteille;

    this.ajouterBouteilleForm.patchValue({
      id: bouteille.id,
      nom: bouteille.nom,
      type: bouteille.type,
      format: bouteille.format,
      prix_saq: bouteille.prix_saq,
      pays: bouteille.pays,
      description: bouteille.description,
      quantite: 1,
      celliers_id: this.idCellierUrl,
    });
    this.filteredData = [];
    this.isDataSelected = true; 
    console.log('isDataSelected:', this.isDataSelected); 
  }

  /**
   * si le data est selectionner par recherche et non pas a 
   * la main, on grise la selection pour ne pas pouvoir la modifier
   */
  onInputChange() {
    this.isDataSelected = false;
  }


  /**
   * function qui prend en main le scan
   * @param scannedBouteille data de la bouteille trouver
   * si la bouteille est trouver on patch le data dans le form ajouter
   */
  handleScan(scannedBouteille: string) {
    this.messageErreur="";
    this.scannedBouteille = scannedBouteille;

    if(this.scannedBouteille){
      this.ajouterBouteilleForm.patchValue({
        id:          this.scannedBouteille.id,
        nom:         this.scannedBouteille.nom,
        type:        this.scannedBouteille.type,
        format:      this.scannedBouteille.format,
        prix_saq:    this.scannedBouteille.prix_saq,
        pays:        this.scannedBouteille.pays,
        description: this.scannedBouteille.description,
        quantite:    1,
        id_celliers: this.idCellierUrl,
      });
    }else{
      this.messageErreur = "Le scan n'a pas fonctionné, veuillez vous assurer que le code est bien visible."
    }
   

  }

  /**
   * function d'ajout de bouteille 
   * put de la bouteille avec l"id du cellier selectionner
   */
  ajouter() {
    this.formSubmitted = true;
    if (this.ajouterBouteilleForm.valid) {
      this.route.params.subscribe((params) => {
        let nouvelleBouteille: Imesbouteilles = this.ajouterBouteilleForm.value;
        nouvelleBouteille.type = Number(nouvelleBouteille.type);

        console.log(params);
        console.log(nouvelleBouteille.celliers_id);
        this.present = false;
        this.fetchService
          .getBouteillesCellier(nouvelleBouteille.celliers_id)
          .subscribe((data: any) => {
            this.bouteilles = data.data;

            console.log('les bouteilles du cellier');
            console.log(this.bouteilles);

            if (this.bouteilles) {
      
              this.bouteilles.forEach(element => {
                if(nouvelleBouteille.id == element.id){
                  this.present = true;
                  element.quantite = element.quantite + 1;
                  this.fetchService.modifBouteille(element.id_supreme, element).subscribe((retour) => {
                    this.openSnackBar('Bouteille ajoutée avec succès', 'Fermer');
                    this.router.navigate(['profil/cellier/' + nouvelleBouteille.celliers_id]);
                  });
                  
                }
    
              });
            }
            if (this.present == false){
              this.fetchService.ajoutBouteille(nouvelleBouteille).subscribe((retour) => {
                this.openSnackBar('Bouteille ajoutée avec succès', 'Fermer');
                this.router.navigate(['profil/cellier/' + nouvelleBouteille.celliers_id]);
              });
            }
          });
      });
    }
  }

  /**
   * function qui reset le form
   */
  clearForm() {
    window.scroll({ // pour scroll up quand on clique sur une bouteille
      top: 0,
      left: 0,
      behavior: 'smooth'
    });

    this.isDataSelected = false;
    const controls = this.ajouterBouteilleForm.controls;
    Object.keys(controls).forEach(controlName => {
      controls[controlName].setValue('');
    });

  }

  /**
   * function a l'initialisation de la page
   * regarde le params id du cellier, le passe en parametre pour lajout de la bouteille dans le bon cellier
   * fetch tout le bouteille de la saq et la recherche se fait sur ce array
   */
  ngOnInit(): void {
    window.scroll({ // pour scroll up quand on arrive sur la page
      top: 0,
      left: 0,
      behavior: 'smooth'
    });

    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
      console.log(this.isSignedIn);
    });

    this.route.params.subscribe((params) => {
        this.idCellierUrl = params['id'];
    })
    
    console.log('le id du cellier preselect');
    console.log(this.idCellierUrl);

    this.fetchService.getBouteilleSAQ().subscribe((response) => {
      this.arrayBouteille = response.data;
      console.log(this.arrayBouteille);
      console.log(this.idCellierUrl);
    });

    this.fetchService.getCelliers().subscribe((data: any) => {
        this.listeCelliers = data.data;
        console.log('les celliers');
        console.log(this.listeCelliers);
        console.log(this.idCellierUrl);
        
    });
        

    this.ajouterBouteilleForm = this.formBuilder.group({ //validation du mon formgroup ajouter bouteille
      id:          [''],
      nom:         ['', [Validators.required]],
      type:        [''],
      pays:        [''],
      format:      [''],
      prix_saq:    [''],
      quantite:    ['', [Validators.required, Validators.pattern(/^\d+$/)]],
      description: [''],
      celliers_id: [this.idCellierUrl],
    });
    
  }
  
  /**
   * Cette fonction affiche un message de type snackbar.
   * @param message Le message à afficher.
   * @param action L'action à afficher sur le bouton de fermeture du snackbar.
   */
  openSnackBar(message: string, action: string) {
    const config = new MatSnackBarConfig();
    config.duration = 3000; // Set the duration to 3 seconds
    config.panelClass = ['mon-snackbar']; // Add a custom CSS class
    this.snackBar.open(message, action, config);
  }


}
