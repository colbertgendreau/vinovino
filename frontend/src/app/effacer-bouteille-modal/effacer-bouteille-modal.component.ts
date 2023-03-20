import { Component, Input, Output, EventEmitter, OnInit } from '@angular/core';
import { FetchService } from '../fetch.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-effacer-bouteille-modal',
  templateUrl: './effacer-bouteille-modal.component.html',
  styleUrls: ['./effacer-bouteille-modal.component.scss']
})
export class EffacerBouteilleModalComponent {

  @Input() id!: number;
  @Input() isVisible = false;
  @Output() itemEfface: EventEmitter<void> = new EventEmitter<void>();
  @Output() closed = new EventEmitter<void>();

  constructor(
    public fetchService: FetchService,
    public router: Router,
  ) { }


  confirmer() {
    window.scroll({ // pour scroll up quand on arrive sur la page
        top: 0, 
        left: 0, 
        behavior: 'smooth' 
    });

    this.isVisible = false;
    console.log(this.id);
    
    this.fetchService.supprimerBouteille(this.id).subscribe((retour) => {
      console.log(retour);
      
      this.itemEfface.emit();
    });
  }

  annuler() {

    this.isVisible = false;
    this.closed.emit(); // emit the 'closed' event
  }
}
