import { Component, Input, Output, EventEmitter, OnInit } from '@angular/core';
import { FetchService } from '../fetch.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-effacer-cellier-modal',
  templateUrl: './effacer-cellier-modal.component.html',
  styleUrls: ['./effacer-cellier-modal.component.scss']
})
export class EffacerModalComponent {
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
    this.fetchService.supprimerCellier(this.id).subscribe((retour) => {
      this.itemEfface.emit();
    });
  }

  annuler() {

    this.isVisible = false;
    this.closed.emit(); // emit the 'closed' event
  }
}
