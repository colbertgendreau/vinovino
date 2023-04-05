import { Component, OnInit, Input, Output } from '@angular/core';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';
import { ICellier } from '../icellier';
import { FetchService } from '../fetch.service';
import { ActivatedRoute, Router } from '@angular/router';
import { Ibouteillecellier } from '../ibouteille-cellier';
import { Imesbouteilles } from '../imesbouteilles';
import { environment } from '../../environments/environment';
import { MatSnackBar, MatSnackBarConfig } from '@angular/material/snack-bar';

// Interface User
export class User {
  name: any;
  email: any;
}

@Component({
  selector: 'app-cellier',
  templateUrl: './cellier.component.html',
  styleUrls: ['./cellier.component.scss'],
})

export class CellierComponent implements OnInit {
  @Input() cellier: ICellier;

  bouteilles: Array<Ibouteillecellier>;
  bouteille: Imesbouteilles;
  cellierId: string;
  cellierNom: string;
  isSignedIn!: boolean;
  UserProfile!: User;
  unCellier: any;
  spin: boolean = true;
  hide: boolean = true;
  pageCellier: boolean = true;
  display: number = 1;
  counterValue: number = 0;
  quantite: number;
  id: number;
  isVisibleSupprimer = false;
  isVisibleArchiver = false;
  inputArchive: any;
  imgBouteilleNonDisponible = environment.baseImg + 'img/nonDispo.webp';

  /**
   * Constructeur de la classe CellierComponent
   * @param auth composant AuthStateService
   * @param router composant Router
   * @param token composant TokenService
   * @param authService composant AuthService
   * @param fetchService composant FetchService
   * @param route composant Route
   * @param snackBar composantMatSnackBar
   */
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
    });
    this.bouteilles = [];
  }

  /**
   * Fonction initiale dès l'instanciation de la classe
   */
  ngOnInit() {
    // pour scroll up quand on arrive sur la page
    window.scroll({
      top: 0,
      left: 0,
      behavior: 'smooth'
    });

    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
    });

    this.route.params.subscribe((params) => {
      this.cellierId = params['id'];
      this.fetchService.getBouteillesCellier(params['id']).subscribe((data: any) => {
        this.bouteilles = (data.data).filter(bouteille => bouteille.quantite > 0);
        this.inputArchive = document.getElementById('archive');
        this.inputArchive.addEventListener('change', e => {
          if (e.target.checked === true) {
            this.fetchService.getBouteillesCellier(params['id']).subscribe((data: any) => {
              this.bouteilles = data.data;
            });
          }
          if (e.target.checked === false) {
            this.fetchService.getBouteillesCellier(params['id']).subscribe((data: any) => {
              this.bouteilles = (data.data).filter(bouteille => bouteille.quantite > 0);
            });
          }
        });
        if (this.bouteilles[0]) {
          this.cellierNom = this.bouteilles[0].cellier_nom;
        }
        this.spin = false;
        this.hide = false;
      });
    });
  }

  /**
   * Fonction qui modifie la quantité d'une bouteille dans un cellier
   * @param id nombre - L'id de la bouteille
   * @param quantite nombre - La quantité initiale de la bouteille dans le cellier
   */
  modifier(id: number, quantite: number) {
    this.fetchService.showBouteille(id).subscribe((data: any) => {
      this.bouteille = data.data;
      this.bouteille.quantite = quantite;
      let updateBouteille: Imesbouteilles = this.bouteille;
      this.fetchService.modifBouteille(id, updateBouteille).subscribe((retour) => {
        if (this.bouteille.quantite > 0) {
          this.openSnackBar('La quantité fut modifiée avec succès', 'Fermer');
        }
        this.route.params.subscribe((params) => {
          this.cellierId = params['id'];
          this.fetchService.getBouteillesCellier(params['id']).subscribe((data: any) => {
            this.bouteilles = (data.data).filter(bouteille => bouteille.quantite > 0);
            // this.bouteilles = data.data;
          });
        });
      });
      if (this.bouteille.quantite == 0) {
        this.openModalArchiver(id, quantite);
      }
    });
  }


  /**
   * Fonction qui permet l'ouverture du modal pour supprimer une bouteille dans un cellier
   * @param id nombre - L'id de la bouteille
   */
  openModalSupprimer(id: number) {
    this.id = id;
    this.isVisibleSupprimer = true;
  }

  /**
   * Fonction qui permet l'ouverture du modal pour archiver une bouteille dans un cellier
   * @param id nombre - L'id de la bouteille
   * @param quantite nombre - La quantité de la bouteille dans le cellier
   */
  openModalArchiver(id: number, quantite: number) {
    this.id = id;
    this.quantite = quantite;
    this.isVisibleArchiver = true;
  }

  /**
   * Fonction qui permet la fermeture des modaux de suppression et d'archivage
   */
  onModalClosed() {
    this.isVisibleSupprimer = false;
    this.isVisibleArchiver = false;
  }

  /**
   * Fonction qui rafraîchit toutes les bouteilles d'un cellier suite à une action dans un modal (suppression ou archivage)
   */
  rafraichirListe() {
    this.route.params.subscribe((params) => {
      this.cellierId = params['id'];
      this.fetchService.getBouteillesCellier(params['id']).subscribe((data: any) => {
        this.bouteilles = data.data;
        this.isVisibleSupprimer = false;
        this.isVisibleArchiver = false;
      });
    });
  }

  /**
   * Fonction qui permet de remonter en haut de la page lorsqu'on arrive sur la page
   */
  goUp() {
    window.scroll({
      top: 0,
      left: 0,
      behavior: 'smooth'
    });
  }

  /**
   * Fonction qui permet le changement d'affichage des bouteilles d'un cellier entre liste et grille
   * @param mode nombre - Le numéro de l'affichage
   */
  changeDisplay(mode: number): void {
    this.display = mode;
    console.log(this.display);
  }

  /**
  * Fonction qui affiche un message de type snackbar
  * @param message chaîne - Le message à afficher
  * @param action chaîne - L'action à afficher sur le bouton de fermeture du snackbar
  */
  openSnackBar(message: string, action: string) {
    const config = new MatSnackBarConfig();
    config.duration = 3000; // durée à 3 secondes
    config.panelClass = ['mon-snackbar']; // ajout d'une classe CSS sur mesure
    this.snackBar.open(message, action, config);
  }
}
