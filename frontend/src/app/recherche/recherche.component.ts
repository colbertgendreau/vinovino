import { Component, Input, Output, EventEmitter, OnInit, ViewChild  } from '@angular/core';
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
  choixPays: string[] = ['Canada', 'Etat-unis', 'France', 'Australie', 'Italie'];
  selectedWineTypes: string[] = [];
  selectedWinePays: string[] = [];

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


// updateSelectedWinePays(checked: boolean, winePays: string) {
//   if (checked) {
//     this.selectedWinePays.push(winePays);
//   } else {
//     this.selectedWinePays = this.selectedWinePays.filter(pays => pays !== winePays);
//   }

//   this.filter();
// }

updateSelectedWinePays(selectedPays: string) {
  this.selectedWinePays = [selectedPays];
  this.filter();
}



filterByType(types:any) {
  console.log(types);
      this.filteredData = this.listeMesBouteilles.filter(bouteille =>
        this.selectedWineTypes.includes(bouteille.type_vino_name));
      console.log(this.filteredData);
}

filterByCountry(pays: any) {
  console.log(pays);
  
      
      this.filteredData = this.listeMesBouteilles.filter(bouteille => 
        this.selectedWinePays.includes(bouteille.pays)
      );
    
    // this.isVisibleM = false;
    
  console.log(this.filteredData);
      
}


filter() {
  if (this.selectedWineTypes.length && this.selectedWinePays.length) {
    this.filteredData = this.listeMesBouteilles.filter(bouteille =>
      this.selectedWineTypes.includes(bouteille.type_vino_name) &&
      this.selectedWinePays.includes(bouteille.pays)
    );
  } else if (this.selectedWineTypes.length) {
    this.filteredData = this.listeMesBouteilles.filter(bouteille =>
      this.selectedWineTypes.includes(bouteille.type_vino_name)
    );
  } else if (this.selectedWinePays.length) {
    this.filteredData = this.listeMesBouteilles.filter(bouteille =>
      this.selectedWinePays.includes(bouteille.pays)
    );
  } else {
    this.filteredData = [];
  }
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
  
  filterByPrice(minPrice: number, maxPrice: number) {
    console.log(minPrice, maxPrice);
  
    // this.filteredData = this.listeMesBouteilles.filter(bouteille => 
    //   bouteille.prix >= minPrice && bouteille.prix <= maxPrice);
  
    // this.isVisibleM = false;
  
    console.log(this.filteredData);
    if (this.selectedWineTypes.length && this.selectedWinePays.length){
      this.filteredData = this.filteredData.filter(bouteille => 
        bouteille.prix >= minPrice && bouteille.prix <= maxPrice);
    }else{
      this.filteredData = this.listeMesBouteilles.filter(bouteille => 
        bouteille.prix >= minPrice && bouteille.prix <= maxPrice);
    }
  }

  // closeModalFilter() {
  //   this.isVisibleM = false;
  //   this.closed.emit();
  // }
  
  



}





// filterByCountry(pays: any) {
//   console.log(pays);
//   if (!this.selectedWinePays && !this.selectedWineTypes) {
//       this.filteredData = this.listeMesBouteilles;
//   }
//   if (this.filteredData.length) {
//       this.filteredData = this.filteredData.filter(bouteille => 
//       this.selectedWinePays.includes(bouteille.pays));
//     } else {
//       this.filteredData = this.listeMesBouteilles.filter(bouteille => 
//         this.selectedWinePays.includes(bouteille.pays)
//       )};
//     console.log(pays);
//     // this.isVisibleM = false;
    
//   console.log(this.filteredData);
      
// }


// filterByType(types:any) {
//   console.log(types);
//     // if (types.length === 0) {
//     //   this.filteredData = this.filteredData;
//     // } 
//   //   if (!this.selectedWinePays && !this.selectedWineTypes) {
//   //     this.filteredData = this.listeMesBouteilles;
//   // }
//     if (this.filteredData.length) {
//       this.filteredData = this.filteredData.filter(bouteille => 
//         this.selectedWineTypes.includes(bouteille.type_vino_name)
//         )}else {
//       this.filteredData = this.listeMesBouteilles.filter(bouteille =>
//         this.selectedWineTypes.includes(bouteille.type_vino_name)
//         );
//       }
//       console.log(this.filteredData);
// }