import { Component, Input, Output, EventEmitter, OnInit } from '@angular/core';

@Component({
  selector: 'app-effacer-modal',
  templateUrl: './effacer-modal.component.html',
  styleUrls: ['./effacer-modal.component.scss']
})
export class EffacerModalComponent {
  @Input() id!: number;
  @Input() isVisible = false;
  @Output() deleteConfirmed = new EventEmitter<void>();
  @Output() closed = new EventEmitter<void>();
  
  effacer(){
    console.log("effacer");
  }

  annuler(){
    console.log("annuler");
    this.isVisible = false;
    this.closed.emit(); // emit the 'closed' event
  }
}
