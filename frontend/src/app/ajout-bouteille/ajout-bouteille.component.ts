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
  // title:string='Ajouter une bouteille';
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

  choixPays: string[] = ['Autre', 'Afrique du Sud', 'Allemagne', 'Argentine', 'Arménie', 'Australie', 'Autriche', 'Bulgarie', 'Brésil', 'Canada', 'Chili', 'Chine', 'Croatie', 'Espagne', 'États-Unis', 'France', 'Géorgie', 'Grèce', 'Hongrie', 'Israël', 'Italie', 'Liban', 'Luxembourg', 'Maroc', 'Mexique', 'Moldavie', 'Nouvelle-Zélande', 'Portugal', 'République Tchèque', 'Roumanie', 'Slovénie', 'Suisse', 'Uruguay'];

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

    //   celliers_id: bouteille.celliers_id,
    });
    this.filteredData = [];
    this.isDataSelected = true; // set the flag to true when data is selected
    console.log('isDataSelected:', this.isDataSelected); // add this line
  }

  onInputChange() {
    this.isDataSelected = false;

  }


  handleScan(scannedBouteille: string) {
    this.scannedBouteille = scannedBouteille;
    console.log(this.scannedBouteille);
    if(this.scannedBouteille){
      this.ajouterBouteilleForm.patchValue({
        id: this.scannedBouteille.id,
        nom: this.scannedBouteille.nom,
        type: this.scannedBouteille.type,
        format: this.scannedBouteille.format,
        prix_saq: this.scannedBouteille.prix_saq,
        pays: this.scannedBouteille.pays,
        description: this.scannedBouteille.description,
        quantite: 1,
        id_celliers: this.idCellierUrl,
      });
    }
   

  }

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
        //   .getBouteillesCellier(params['id'])
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
                    // this.router.navigateByUrl('profil/cellier/' + 2);
                    this.router.navigateByUrl('profil/cellier/' + nouvelleBouteille.celliers_id);
                  });
                  
                }
    
              });
            }
            if (this.present == false){
              this.fetchService.ajoutBouteille(nouvelleBouteille).subscribe((retour) => {
                this.openSnackBar('Bouteille ajoutée avec succès', 'Fermer');
                this.router.navigateByUrl('profil/cellier/' + nouvelleBouteille.celliers_id);
              });
            }
          });

        
      
      });

    }
  }

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
        

    this.ajouterBouteilleForm = this.formBuilder.group({
      id: [''],
      nom: ['', [Validators.required]],
      type: [''],
      pays: [''],
      format: [''],
      prix_saq: [''],
      quantite: ['', [Validators.required, Validators.pattern(/^\d+$/)]],
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
