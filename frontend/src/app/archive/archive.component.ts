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

// interface User
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
  bouteillesArchivees: Array<Ibouteillecellier>;
  bouteille: Imesbouteilles;
  cellierId: number;
  cellierNom: string;
  isSignedIn!: boolean;
  UserProfile!: User;
  unCellier: any;
  spin: boolean = true;
  hide: boolean = true;
  pageCellier: boolean = true;
  counterValue: number = 0;
  quantite: number;
  id: number;
  celliers_nom: string;
  isVisible = false;
  imgBouteilleNonDisponible = environment.baseImg + 'img/nonDispo.webp';

  /**
   * Constructeur de la classe ArchiveComponent
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
    this.bouteillesArchivees = [];
  }

  /**
   * Fonction initiale dès l'instanciation de la classe
   */
  ngOnInit() {
    window.scroll({ // pour scroll up quand on arrive sur la page
      top: 0,
      left: 0,
      behavior: 'smooth'
    });
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
    });
    this.fetchService.getMesBouteilles().subscribe((data: any) => {
      this.bouteilles = data.data;
      this.formatagePrix();
      for (var i = 0; i < this.bouteilles.length; i++) {
        if (this.bouteilles[i].quantite === 0) {
          this.bouteillesArchivees.push(this.bouteilles[i]);
        }
      }
      this.bouteillesArchivees.forEach(uneBouteille => {
        this.cellierId = uneBouteille.celliers_id;
      });
      this.spin = false;
      this.hide = false;
    });
  }

  /**
   * Fonction qui formate le prix des bouteilles pour avoir deux décimales
   */
  formatagePrix() {
    if (this.bouteilles) {
      this.bouteilles.forEach(uneBouteille => {
        if (uneBouteille.prix_bouteillePerso) {
          uneBouteille.prix_bouteillePerso = (uneBouteille.prix_bouteillePerso).toFixed(2);
        }
        if (uneBouteille.prix_saq) {
          uneBouteille.prix_saq = (uneBouteille.prix_saq).toFixed(2);
        }
      });
    }
  }

  /**
   * Fonction qui modifie la quantité d'une bouteille dans les bouteilles archivées
   * @param id nombre - L'id de la bouteille archivée
   * @param quantite nombre - La quantité de la bouteille archivée (quantité à 0)
   * @param celliers_nom chaîne - Le nom du cellier de la bouteille archivée
   */
  modifier(id: number, quantite: number, celliers_nom: string) {
    this.fetchService.showBouteille(id).subscribe((data: any) => {
      this.bouteille = data.data;
      this.bouteille.quantite = quantite;
      this.openSnackBar('La bouteille a été déplacée dans le cellier ' + celliers_nom, 'Fermer');
      let updateBouteille: Imesbouteilles = this.bouteille;
      this.fetchService.modifBouteille(id, updateBouteille).subscribe((retour) => {
        this.bouteillesArchivees.forEach(uneBouteille => {
          this.cellierId = uneBouteille.celliers_id;
        });
        this.route.params.subscribe((params) => {
          this.fetchService.getMesBouteilles().subscribe((data: any) => {
            this.bouteillesArchivees = (data.data).filter(bouteille => bouteille.quantite === 0);
            this.bouteillesArchivees.forEach(uneBouteille => {
              if (uneBouteille.prix_bouteillePerso) {
                uneBouteille.prix_bouteillePerso = (uneBouteille.prix_bouteillePerso).toFixed(2);
              }
              if (uneBouteille.prix_saq) {
                uneBouteille.prix_saq = (uneBouteille.prix_saq).toFixed(2);
              }
            });
          });
        });
        this.spin = false;
        this.hide = false;
      });
    });
  }

  /**
   * Fonction qui permet l'ouverture du modal pour supprimer une bouteille dans un cellier
   * @param id nombre - L'id de la bouteille
   */
  openModal(id: number) {
    console.log(id);
    console.log(this.isVisible);
    this.id = id;
    this.isVisible = true;
  }

  /**
   * Fonction qui permet la fermeture du modal de suppression
   */
  onModalClosed() {
    this.isVisible = false;
  }

  /**
   * Fonction qui permet de remonter en haut de la page lorsqu'on arrive sur la page
   */
  goUp() {
    window.scroll({ // pour scroll up quand on arrive sur la page
      top: 0,
      left: 0,
      behavior: 'smooth'
    });
  }

  /**
  * Fonction qui affiche un message de type snackbar
  * @param message Le message à afficher
  * @param action L'action à afficher sur le bouton de fermeture du snackbar
  */
  openSnackBar(message: string, action: string) {
    const config = new MatSnackBarConfig();
    config.duration = 3000; // Set the duration to 3 seconds
    config.panelClass = ['mon-snackbar']; // Add a custom CSS class
    this.snackBar.open(message, action, config);
  }
}
