import { Component, OnInit, AfterViewInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { filter } from 'rxjs/operators';
import { FetchService } from '../fetch.service';
import { Imesbouteilles } from '../imesbouteilles';

@Component({
  selector: 'app-mes-bouteilles',
  templateUrl: './mes-bouteilles.component.html',
  styleUrls: ['./mes-bouteilles.component.scss']
})
export class MesBouteillesComponent implements AfterViewInit {
  type: string;
  pays: string;
  orderObj:any;
  filteredData:any = [];
  // currentFilter: string = 'All';
  filters: string[] = [];
  listeMesBouteilles: Array<Imesbouteilles>;
  constructor(private route: ActivatedRoute,
    public fetchService: FetchService,) { 
      this.listeMesBouteilles=[];
      this.route.queryParamMap
    .subscribe((params) => {
      this.orderObj = { ...params.keys, ...params };
      console.log(this.orderObj.params.type);
       this.type = this.orderObj.params.type
       this.pays = this.orderObj.params.pays
       if(this.type){
        this.filterByType(this.type);
        
      }
      if(this.pays){
        this.filterByCountry(this.pays);
      }
      
    }
  
    );
    }
    

    ngAfterViewInit() {

    

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

      // if(this.type){
      //   this.filterByType(this.type);
        
      // }
      // if(this.pays){
      //   this.filterByCountry(this.pays);
      // }

    });

    

    
    
    // this.route.queryParams
    // .filter(params => params.type)
    // .subscribe(params => {
    //   console.log(params); // { type: "popular" }

    //   this.type = params.type;

    //   console.log(this.type); // popular
    // }
  // );
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

    
    
    if(this.filteredData.length){
      this.filteredData = this.filteredData.filter(bouteille => 
        
        bouteille.type_vino_name.toLowerCase().includes(type.toLowerCase()));
        this.filters.push(type);
    }else{
      
      this.filteredData = this.listeMesBouteilles.filter(bouteille => 
        bouteille.type_vino_name.toLowerCase().includes(type.toLowerCase()));
        console.log(this.listeMesBouteilles);
        this.filters.push(type);
    }
  
      console.log(type);
      // this.isVisibleM = false;
      // this.closed.emit();
      
    console.log(this.filteredData);












    
    // if(this.filteredData.length){
    //   this.filteredData = this.filteredData.filter(bouteille => 
    //     bouteille.type_vino_name == type);
    // }else{
  
    //   this.filteredData = this.listeMesBouteilles.filter(bouteille => 
    //     bouteille.type_vino_name == type);
    // }
  
    //   console.log(type);
    //   // this.isVisibleM = false;
    //   // this.closed.emit();
      
    // console.log(this.filteredData);
    
  }
  
    filterByCountry(pays: string) {
    console.log(pays);
    
    this.filteredData = this.listeMesBouteilles.filter(bouteille => 
      bouteille.pays == pays);
      console.log(pays);
      // this.isVisibleM = false;
      
    console.log(this.filteredData);
    
  }
  
  filterByPrice(minPrice: number, maxPrice: number) {
    console.log(minPrice, maxPrice);
  
    this.filteredData = this.listeMesBouteilles.filter(bouteille => 
      bouteille.prix >= minPrice && bouteille.prix <= maxPrice);
  
    // this.isVisibleM = false;
  
    console.log(this.filteredData);
  }

  // closeModalFilter() {
  //   this.isVisibleM = false;
  //   this.closed.emit();
  // }


  removeFilter(filter: string) {
    const index = this.filters.indexOf(filter);
    if (index !== -1) {
      this.filters.splice(index, 1);
      this.filteredData = this.listeMesBouteilles.filter(item => {
        // Apply all the remaining filters on each item
        return this.filters.every(filter => {
          // Implement your filter logic here
          // Return true if the item should be included in the filtered data
        });
      });
    }
  }

}
