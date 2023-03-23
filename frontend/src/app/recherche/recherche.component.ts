import { Component, Input, Output, EventEmitter, OnInit, ViewChild  } from '@angular/core';
import { Router } from '@angular/router';
import { TokenService } from '../shared/token.service';
import { AuthStateService } from '../shared/auth-state.service';
import { AuthService } from '../shared/auth.service';
import { FetchService } from '../fetch.service';
import { ActivatedRoute } from '@angular/router';
import { IlisteCellier } from '../iliste-cellier';
import { ICellier } from '../icellier';
// import { EffacerModalComponent } from '../effacer-modal/effacer-modal.component';
import { Ilistemesbouteilles } from '../ilistemesbouteilles';
import { Imesbouteilles } from '../imesbouteilles';

@Component({
  selector: 'app-recherche',
  templateUrl: './recherche.component.html',
  styleUrls: ['./recherche.component.scss']
})
export class RechercheComponent {

  

  // title:string='Liste des celliers';
  // UserProfile!: User;
  listeMesBouteilles: Array<Imesbouteilles>;
  unCellier: ICellier;
  @Input() isVisibleM = false;
  @Output() closed = new EventEmitter<void>();
  filteredData:any = [];
  searchTerm:any = '';
  minPrice:number;
  maxPrice:number;
  id: number;
  isVisible = false;
  choixTypes: string[] = ['Vin rouge', 'Vin blanc', 'Vin rosé'];
  choixPays: string[] = ['Tout les pays','Canada', 'États-Unis', 'France', 'Australie', 'Italie', 'Espagne', 'Chili', 'Portugal', 'Argentine', 'Afrique du Sud', 'Allemagne', 'Autriche', 'Grèce', 'Nouvelle-Zélande', 'Israël', 'Liban', 'Hongrie', 'Roumanie', 'Uruguay', 'Arménie', 'Géorgie', 'Slovénie', 'Moldavie', 'Suisse', 'Bulgarie', 'Chine', 'Luxembourg', 'Mexique', 'Brésil', 'Croatie', 'Maroc', 'République Tchèque'];
  selectedWineTypes: string[] = [];
  selectedWinePays: string[] = [];

  numberOfResult:number;

  dataDejaFilter: any[] = [];
  dataToFilter: any[] = [];

  // isVisibleM: boolean = false;

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

    // this.listeCelliers = [];

  }


  ngOnInit() {
    this.fetchService.getMesBouteilles().subscribe((data: any) => {
      this.listeMesBouteilles = data.data;
      for (let i = 0; i < this.listeMesBouteilles.length; i++) {
        const bouteille = this.listeMesBouteilles[i];
        bouteille.nom = bouteille.nom || bouteille.nom_bouteillePerso;
        bouteille.type_vino_name = bouteille.type_vino_name || bouteille.type_mes_name;
        bouteille.pays = bouteille.pays || bouteille.pays_bouteillePerso;
        bouteille.prix = bouteille.prix_bouteillePerso || bouteille.prix_saq;
      }
      console.log(this.listeMesBouteilles);
      // this.originalData = this.listeMesBouteilles;
    });
  }

//   ngOnInit() {
//   this.fetchService.getMesBouteilles().subscribe((data: any) => {
//     this.listeMesBouteilles = data.data;
//     for (let i = 0; i < this.listeMesBouteilles.length; i++) {
//       if (this.listeMesBouteilles[i].nom == null) {
//         this.listeMesBouteilles[i].nom = this.listeMesBouteilles[i].nom_bouteillePerso
//       }
//       if (this.listeMesBouteilles[i].type_vino_name == null) {
//         this.listeMesBouteilles[i].type_vino_name = this.listeMesBouteilles[i].type_mes_name
//       }
//       if (this.listeMesBouteilles[i].pays == null) {
//         this.listeMesBouteilles[i].pays = this.listeMesBouteilles[i].pays_bouteillePerso
//       }
//       if (this.listeMesBouteilles[i].prix_saq == null) {
//         this.listeMesBouteilles[i].prix = this.listeMesBouteilles[i].prix_bouteillePerso
//       }else{
//         if (this.listeMesBouteilles[i].prix_bouteillePerso == null) {
//           this.listeMesBouteilles[i].prix = this.listeMesBouteilles[i].prix_saq;
//         }
//       }
//     }
//     console.log(this.listeMesBouteilles);
//   });

// }




isSelected(wineType: string) {
  return this.selectedWineTypes.includes(wineType);
}

isSelectedPays(winePays: string) {
  return this.selectedWinePays.includes(winePays);
}

updateSelectedWineTypes(checked: boolean, wineType: string) {
  if (checked) {
    this.selectedWineTypes.push(wineType);
  } else {
    this.selectedWineTypes = this.selectedWineTypes.filter(type => type !== wineType);
  }

  this.filter();
}

updateSelectedWinePays(selectedPays: string) {
  this.selectedWinePays = [selectedPays];
  this.minPrice = null;
  this.maxPrice = null;
  this.dataDejaFilter=[];
  this.filter();
}




// filterByType(types:any) {
//   console.log(types);
//       this.filteredData = this.listeMesBouteilles.filter(bouteille =>
//         this.selectedWineTypes.includes(bouteille.type_vino_name));
//       console.log(this.filteredData);
// }

// filterByCountry(pays: any) {
//   console.log(pays);
//       this.filteredData = this.listeMesBouteilles.filter(bouteille => 
//         this.selectedWinePays.includes(bouteille.pays)
//       );
//   console.log(this.filteredData);
      
// }

filter() {
  if (this.selectedWineTypes.length === 0 && this.selectedWinePays.length === 0) {
    this.filteredData = [];
    this.numberOfResult = null;
    return;
  }

  this.filteredData = this.listeMesBouteilles.filter(bouteille => {
    const typeMatch = this.selectedWineTypes.length === 0 || this.selectedWineTypes.includes(bouteille.type_vino_name);
    const paysMatch = this.selectedWinePays.length === 0 || this.selectedWinePays.includes(bouteille.pays) || this.selectedWinePays[0] === 'Tout les pays';
    return typeMatch && paysMatch;
  });
  this.numberOfResult = this.filteredData.length;
}



  filterData(searchTerm: string) {
    console.log(searchTerm);
    
    if (searchTerm.length < 1) {
      this.filteredData = [];
    } else {
      this.filteredData = this.listeMesBouteilles.filter(item =>
        item.nom.toLowerCase().includes(searchTerm.toLowerCase())
      );
    }
  }
  
  // filterByPrice(minPrice: number, maxPrice: number) {
  //   console.log(minPrice, maxPrice);
  //   console.log(this.filteredData);
  //   if (this.selectedWineTypes.length || this.selectedWinePays.length){
  //     console.log("ici");
      
  //     this.filteredData = this.filteredData.filter(bouteille => 
  //       bouteille.prix >= minPrice && bouteille.prix <= maxPrice);
  //       this.numberOfResult = this.filteredData.length;
  //   }else{
  //     this.filteredData = this.listeMesBouteilles.filter(bouteille => 
  //       bouteille.prix >= minPrice && bouteille.prix <= maxPrice);
  //       this.numberOfResult = this.filteredData.length;
  //   }
  // }

    filterByPrice(minPrice: number, maxPrice: number) {
      console.log(minPrice, maxPrice);
      console.log(this.filteredData);
      
      
      // Make a copy of the original data if this is the first time the function is called
      if (this.dataDejaFilter.length === 0) {
        console.log("ici1");
        
          this.dataDejaFilter = [...this.filteredData];
          console.log(this.dataDejaFilter);
          
      }
      
      // Use the copy for filtering if there are other filters applied
      if(this.dataToFilter){
        console.log("ici2");
        this.dataToFilter = this.selectedWineTypes.length || this.selectedWinePays.length
        ? [...this.dataDejaFilter]
        : [...this.listeMesBouteilles];
      }
      

      this.dataToFilter = this.dataToFilter.filter(bouteille => bouteille.prix >= minPrice && bouteille.prix <= maxPrice);
      if(!minPrice && !maxPrice && !this.selectedWinePays && !this.selectedWineTypes){
        console.log("ici3");
        this.filteredData = this.listeMesBouteilles
      }
   
      if ((!minPrice && !maxPrice) && (this.selectedWinePays || this.selectedWineTypes)) {
        console.log("ici4");
        this.filteredData = this.filteredData;
    }
    
      else{
        console.log("ici5");
        this.filteredData = this.dataToFilter;
      }
      this.numberOfResult = this.filteredData.length;
    }



}


