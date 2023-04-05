import { Component, Input } from '@angular/core';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { CellierComponent } from '../cellier/cellier.component';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss'],
})

export class FooterComponent {
  @Input() id!: number;

  classeActuelle: object;
  pageActuelle: string;
  idCellier: any;
  btnAjouter: string;

  /**
   * Constructeur de la classe FooterComponent
   * @param router composant Router
   * @param route composant ActivatedRoute
   */
  constructor(
    public router: Router,
    private route: ActivatedRoute
  ) { }

  /**
   * Fonction initiale dès l'instanciation de la classe
   */
  ngOnInit() {
    this.classeActuelle = this.route.component;
    this.route.params.subscribe((params) => {
      this.idCellier = params['id'];
    });


    if(this.classeActuelle == CellierComponent) {
        this.pageActuelle = 'cellier';
    }

  }

  /**
   * Fonction qui permet de naviguer vers la page liste-cellier
   */
  back() {
    this.router.navigateByUrl('profil/liste-cellier');
    // pour remonter vers le haut de la page
    window.scroll({
      top: 0,
      left: 0,
      behavior: 'smooth',
    });
  }

  /**
   * Fonction qui permet l'ajout d'une bouteille dans un cellier
   */
  ajouter() {
    if (this.pageActuelle == 'cellier') {
      this.btnAjouter = 'ajoutBouteille';
      this.router.navigateByUrl('profil/ajouter-bouteille/' + this.idCellier);
    } else {
      this.btnAjouter = 'ajoutBouteille';
      this.router.navigateByUrl('profil/ajouter-bouteille/');
    }
    // pour remonter vers le haut de la page
    window.scroll({
      top: 0,
      left: 0,
      behavior: 'smooth',
    });
  }

  /**
   * Fonction qui permet de remonter vers le haut de la page
   */
  goUp() {
    window.scroll({
      top: 0,
      left: 0,
      behavior: 'smooth',
    });
  }
}
