import { Component } from '@angular/core';
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

    pageActuelle:object;
    idCellier:number;

    
    
    constructor(
        public router: Router,
        private route: ActivatedRoute,
        private boutonAjouterBouteille: AjoutBouteilleComponent,
    ) {}

    
    
    ngOnInit() {
        this.pageActuelle = this.route.component;
        console.log(this.pageActuelle);
        
        this.route.params.subscribe((params) => {
            this.idCellier = params['id'];
            console.log(this.idCellier);          
        });

    }

    
    
    back() {
              
  
        console.log(this.pageActuelle);
        if(this.pageActuelle == CellierComponent) {
            this.router.navigate(['liste-cellier']);
        } else if(this.pageActuelle == ListeCellierComponent) {
            console.log('doit etre grisé');
        } else if(this.pageActuelle == AjoutBouteilleComponent) {
            this.router.navigate(['/cellier/'+this.idCellier]);
        } else if(this.pageActuelle == AjoutCellierComponent) {
            this.router.navigate(['liste-cellier']);   
        } else if(this.pageActuelle == ModifCellierComponent) {
            this.router.navigate(['liste-cellier']);   
        } else if(this.pageActuelle == ModifBouteilleComponent) {
            this.router.navigate(['liste-cellier']);   
        }
        
        window.scroll({ // pour scroll up 
        top: 0, 
        left: 0, 
        behavior: 'smooth' 
        });
  }

  ajouter() {
    console.log('ajouter bouteille');
    console.log(this.pageActuelle);
    if(this.pageActuelle == CellierComponent) {
        console.log('ajout bouteille');
        this.router.navigate(['/ajouter-bouteille/'+this.idCellier]);
    } else if(this.pageActuelle == ListeCellierComponent) {
        console.log('ajout cellier');
        this.router.navigate(['ajouter-cellier']);
        
    } else if(this.pageActuelle == AjoutBouteilleComponent) {
        this.router.navigate(['/cellier/'+this.idCellier]);
    } else if(this.pageActuelle == AjoutCellierComponent) {
        this.router.navigate(['liste-cellier']);   
    } else if(this.pageActuelle == ModifCellierComponent) {
        this.router.navigate(['liste-cellier']);   
    } else if(this.pageActuelle == ModifBouteilleComponent) {
        this.router.navigate(['liste-cellier']);   
    }

    window.scroll({ // pour scroll up 
    top: 0, 
    left: 0, 
    behavior: 'smooth' 
    });

  }

  goUp() {
    console.log("par en haut");
    
    window.scroll({ // pour scroll up quand on arrive sur la page
        top: 0, 
        left: 0, 
        behavior: 'smooth' 
    });

  }
}
