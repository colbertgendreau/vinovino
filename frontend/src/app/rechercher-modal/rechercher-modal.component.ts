import { Component, Input, Output, EventEmitter, OnInit } from '@angular/core';
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
  selector: 'app-rechercher-modal',
  templateUrl: './rechercher-modal.component.html',
  styleUrls: ['./rechercher-modal.component.scss']
})
export class RechercherModalComponent{


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

  // isVisibleM: boolean = false;

  iconeTrash = '../assets/icones/trash-347.png';
  iconeModif = '../assets/icones/edit-black.png';

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

  closeModalFilter() {
    this.isVisibleM = false;
    this.closed.emit();
  }
  
  

}
