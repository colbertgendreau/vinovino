import { Component, Input } from '@angular/core';
import { Router } from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import { CellierComponent } from '../cellier/cellier.component';
import { ListeCellierComponent } from '../liste-cellier/liste-cellier.component';
import { AjoutBouteilleComponent } from '../ajout-bouteille/ajout-bouteille.component';
import { AjoutCellierComponent } from '../ajout-cellier/ajout-cellier.component';
import { ModifCellierComponent } from '../modif-cellier/modif-cellier.component';
import { ModifBouteilleComponent } from '../modif-bouteille/modif-bouteille.component';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss'],
})
export class FooterComponent {
  @Input() id!: number;

  classeActuelle: object;
  pageActuelle: string;
  idCellier: number;
  btnAjouter: string;

  constructor(
    public router: Router,
    private route: ActivatedRoute
  ) 
  {}

  ngOnInit() {
    this.classeActuelle = this.route.component;
    console.log(this.classeActuelle);

    this.route.params.subscribe((params) => {
      this.idCellier = params['id'];
    });

    switch (this.classeActuelle) {
      case CellierComponent:
        this.pageActuelle = 'cellier';
        break;
      case ListeCellierComponent:
        this.pageActuelle = 'listeCellier';
        break;
      case AjoutBouteilleComponent:
        this.pageActuelle = 'ajoutBouteille';
        break;
      case AjoutCellierComponent:
        this.pageActuelle = 'ajoutCellier';
        break;
      case ModifCellierComponent:
        this.pageActuelle = 'cellier';
        break;
      case ModifBouteilleComponent:
        this.pageActuelle = 'modifBouteille';
        break;
    default:
        this.pageActuelle = 'autrePage';
        break;
    }
  }

  back() {
    console.log(this.pageActuelle);
    if (this.pageActuelle == 'cellier') {
      this.router.navigate(['liste-cellier']);
    } else if (this.pageActuelle == 'listeCellier') {
      console.log('doit etre grisé');
    } else if (this.pageActuelle == 'ajoutBouteille') {
      this.router.navigate(['/cellier/' + this.idCellier]);
    } else if (this.pageActuelle == 'ajoutCellier') {
      this.router.navigate(['liste-cellier']);
    } else if (this.pageActuelle == 'modifCellier') {
      this.router.navigate(['liste-cellier']);
    } else if (this.pageActuelle == 'modifBouteille') {
      this.router.navigate(['/cellier/' + this.id]);

      // this.router.navigate(['liste-cellier']);
    }

    window.scroll({
      // pour scroll up
      top: 0,
      left: 0,
      behavior: 'smooth',
    });
  }

  ajouter() {
    console.log('ajouter bouteille');
    console.log(this.pageActuelle);
    if (this.pageActuelle == 'cellier') {
      this.btnAjouter = 'ajoutCellier';
      this.router.navigate(['/ajouter-bouteille/' + this.idCellier]);
    } else if (this.pageActuelle == 'listeCellier') {
      this.btnAjouter = 'ajoutBouteille';
      this.router.navigate(['ajouter-cellier']);
    } else {
        console.log("different bouton ajouter");
        
    }

    window.scroll({
      // pour scroll up
      top: 0,
      left: 0,
      behavior: 'smooth',
    });
  }

  goUp() {
    console.log('par en haut');

    window.scroll({
      // pour scroll up quand on arrive sur la page
      top: 0,
      left: 0,
      behavior: 'smooth',
    });
  }
}
