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
    this.isVisible = false;
    console.log("works");
    
    this.fetchService.supprimerBouteille(this.id).subscribe((retour) => {
      this.itemEfface.emit();
    });
  }

  annuler() {

    this.isVisible = false;
    this.closed.emit(); // emit the 'closed' event
  }
}
