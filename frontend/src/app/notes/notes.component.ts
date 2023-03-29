import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-notes',
  templateUrl: './notes.component.html',
  styleUrls: ['./notes.component.scss']
})
export class NotesComponent implements OnInit {

  lesEtoiles = [1, 2, 3, 4, 5];
  noteSelectionnee: number = 0;

  constructor() { }

  ngOnInit() {
    
  }

  RecupererNote(note: number) {
    this.noteSelectionnee = note;
    console.log('Note sélectionnée : ' + this.noteSelectionnee);
    // you can add additional logic here to handle the selected star rating
  }

}
