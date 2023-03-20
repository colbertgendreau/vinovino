import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';
import { FetchService } from '../fetch.service';
import { ActivatedRoute } from '@angular/router';
import { IlisteCellier } from '../iliste-cellier';
import { ICellier } from '../icellier';
import { EffacerModalComponent } from '../effacer-modal/effacer-modal.component';
import { Ilistemesbouteilles } from '../ilistemesbouteilles';
import { Imesbouteilles } from '../imesbouteilles';

// User interface
// export class User {
//   name: any;
//   email: any;
// }

@Component({
  selector: 'app-liste-cellier',
  templateUrl: './liste-cellier.component.html',
  styleUrls: ['./liste-cellier.component.scss']
})

export class ListeCellierComponent implements OnInit {

  isSignedIn!: boolean;
  // title:string='Liste des celliers';
  // UserProfile!: User;
  listeCelliers: Array<ICellier>;
  listeMesBouteilles: Array<Imesbouteilles>;
  unCellier: ICellier;

  filteredData:any = [];
  searchTerm:any = '';
  minPrice:number;
  maxPrice:number;
  id: number;
  isVisible = false;

  isVisibleM: boolean = false;

  iconeTrash = '../assets/icones/trash-347.png';
  iconeModif = '../assets/icones/edit-black.png';

  constructor(
    private auth: AuthStateService,
    public router: Router,
    public token: TokenService,
    public authService: AuthService,
    public fetchService: FetchService,
    private route: ActivatedRoute,
  ) {

    this.listeCelliers = [];

  }

  ngOnInit() {
    this.auth.userAuthState.subscribe((val) => {
      this.isSignedIn = val;
      console.log(this.isSignedIn);
    });

    this.fetchService.getCelliers().subscribe((data: any) => {
      this.listeCelliers = data.data;
      console.log(this.listeCelliers);
    });

    this.fetchService.getMesBouteilles().subscribe((data: any) => {
      this.listeMesBouteilles = data.data;
      for (let i = 0; i < this.listeMesBouteilles.length; i++) {
        if (this.listeMesBouteilles[i].nom == null) {
          this.listeMesBouteilles[i].nom = this.listeMesBouteilles[i].nom_bouteillePerso
        }
        if (this.listeMesBouteilles[i].type_vino_name == null) {
          this.listeMesBouteilles[i].type_vino_name = this.listeMesBouteilles[i].type_mes_name
        }
        if (this.listeMesBouteilles[i].pays == null) {
          this.listeMesBouteilles[i].pays = this.listeMesBouteilles[i].pays_bouteillePerso
        }
        if (this.listeMesBouteilles[i].prix_saq == null) {
          this.listeMesBouteilles[i].prix = this.listeMesBouteilles[i].prix_bouteillePerso
        }else{
          if (this.listeMesBouteilles[i].prix_bouteillePerso == null) {
            this.listeMesBouteilles[i].prix = this.listeMesBouteilles[i].prix_saq;
          }
        }
      }
      console.log(this.listeMesBouteilles);
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

  openModalFilter() {
    this.isVisibleM = true;
  }
  closeModalFilter() {
    this.isVisibleM = false;
  }

  rafraichirListe(){
    this.fetchService.getCelliers().subscribe((data: any) => {
      this.listeCelliers = data.data;
      console.log(this.listeCelliers);
    });
  }


  filterData(searchTerm: string) {
  console.log(searchTerm);
  
  if (searchTerm.length < 3) {
    this.filteredData = [];
  } else {
    this.filteredData = this.listeMesBouteilles.filter(item =>
      item.nom.toLowerCase().includes(searchTerm.toLowerCase())
    );
  }
}

  filterByType(type: string) {
  console.log(type);
  console.log(this.filteredData);
  
  
  if(this.filteredData.length){
    this.filteredData = this.filteredData.filter(bouteille => 
      bouteille.type_vino_name == type);
  }else{

    this.filteredData = this.listeMesBouteilles.filter(bouteille => 
      bouteille.type_vino_name == type);
  }

    console.log(type);
    this.isVisibleM = false;
    
  console.log(this.filteredData);
  
}

  filterByCountry(pays: string) {
  console.log(pays);
  
  this.filteredData = this.listeMesBouteilles.filter(bouteille => 
    bouteille.pays == pays);
    console.log(pays);
    this.isVisibleM = false;
    
  console.log(this.filteredData);
  
}

filterByPrice(minPrice: number, maxPrice: number) {
  console.log(minPrice, maxPrice);

  this.filteredData = this.listeMesBouteilles.filter(bouteille => 
    bouteille.prix >= minPrice && bouteille.prix <= maxPrice);

  this.isVisibleM = false;

  console.log(this.filteredData);
}


}
