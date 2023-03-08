import { Component, OnInit } from '@angular/core';
import { IBouteille } from '../ibouteille';
import { FetchService } from '../fetch.service';

@Component({
  selector: 'app-ajout-bouteille',
  templateUrl: './ajout-bouteille.component.html',
  styleUrls: ['./ajout-bouteille.component.scss']
})
export class AjoutBouteilleComponent implements OnInit{
  arrayBouteille:Array<IBouteille>;
  
  constructor(public fetchSaq:FetchService){
    this.arrayBouteille = [];
    

  }

 

  ngOnInit(): void {
    this.fetchSaq.getBouteilleSAQ().subscribe((response) => {
      this.arrayBouteille = response.data;
      
      
      
    });
  }


}
