import { Component, OnInit, Input, Output } from '@angular/core';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';
import { ICellier } from '../icellier';
import { FetchService } from '../fetch.service';
import { ActivatedRoute, Router } from '@angular/router';
import { Ibouteillecellier } from '../ibouteille-cellier';
import { Imesbouteilles } from '../imesbouteilles';
import { EffacerBouteilleModalComponent } from '../effacer-bouteille-modal/effacer-bouteille-modal.component';
import { environment } from '../../environments/environment';
import { MatSnackBar, MatSnackBarConfig } from '@angular/material/snack-bar';




// User interface
export class User {
  name: any;
  email: any;
}

@Component({
  selector: 'app-archive',
  templateUrl: './archive.component.html',
  styleUrls: ['./archive.component.scss']
})

export class ArchiveComponent implements OnInit {
  @Input() cellier: ICellier;

  bouteilles: Array<Ibouteillecellier>;
  bouteille: Imesbouteilles;
  // cellierId: string;
  cellierId: number;
  cellierNom:string;
  isSignedIn!: boolean;
  UserProfile!: User;
  unCellier: any;
  spin: boolean = true;
  hide: boolean = true;
  pageCellier: boolean = true;

  //   counter:number = 1;
  counterValue: number = 0;
  quantite: number;
  id: number;
  celliers_nom: string;

  isVisible = false;

  imgBouteilleNonDisponible = environment.baseImg + 'img/nonDispo.webp';

  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService,
    public authService: AuthService,
    public fetchService: FetchService,
    private route: ActivatedRoute,
    private snackBar: MatSnackBar
  ) {
    this.authService.profileUser().subscribe((data: any) => {
      this.UserProfile = data;
      console.log(this.UserProfile);
    });
    this.bouteilles = [];


  }



  ngOnInit() {

    window.scroll({ // pour scroll up quand on arrive sur la page
      top: 0,
      left: 0,
      behavior: 'smooth'
    });


    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
      console.log(this.isSignedIn);
    });


    // this.route.params.subscribe((params) => {

    //   this.cellierId = params['id'];
    //   console.log(params['id']);

    

      this.fetchService
        // .getBouteillesCellier(params['id'])
        .getMesBouteilles()
        .subscribe((data: any) => {
          this.bouteilles = data.data;

          console.log(this.bouteilles);

          this.bouteilles.forEach(uneBouteille => {
            this.cellierId = uneBouteille.celliers_id;
            // console.log(uneBouteille.celliers_id);
          });
  

          
          
          console.log('les bouteilles du cellier');
          console.log(this.bouteilles);
          this.spin = false;
          this.hide = false;
          
        });
    // });
  }


  modifier(id: number, quantite: number, celliers_nom: string) {

    console.log(id + "id");
    console.log(quantite + "quantite");
    console.log(celliers_nom + "cellier_nom");

    this.fetchService.showBouteille(id).subscribe((data: any) => {
      this.bouteille = data.data;
      // this.bouteille.id = id;
      this.bouteille.quantite = quantite;

      console.log(this.bouteille.celliers_id);
      this.openSnackBar('La bouteille a été déplacée dans le cellier '+celliers_nom, 'Fermer');


      let updateBouteille: Imesbouteilles = this.bouteille;
      console.log(updateBouteille);
      
      this.fetchService.modifBouteille(id, updateBouteille).subscribe((retour) => {

        this.bouteilles.forEach(uneBouteille => {
          this.cellierId = uneBouteille.celliers_id;
          console.log(uneBouteille.celliers_id);
        });

        this.fetchService.getMesBouteilles().subscribe((data: any) => {
          this.bouteilles = data.data;  
          this.spin = false;
          this.hide = false;            
        });
      });
    });
  }


  // modal d'effacement

  openModal(id: number) {
    console.log(id);
    console.log(this.isVisible);
    this.id = id;
    this.isVisible = true;
  }

  closeModal() {
    this.isVisible = false;
  }

  onModalClosed() {
    this.isVisible = false;
  }

  goUp() {
    console.log("par en haut");

    window.scroll({ // pour scroll up quand on arrive sur la page
      top: 0,
      left: 0,
      behavior: 'smooth'
    });
  }

  pageCelliers() {
    window.scroll({ // pour scroll up
      top: 0,
      left: 0,
      behavior: 'smooth'
    });
    this.router.navigateByUrl('profil/liste-cellier');
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
