import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { Imesbouteilles } from '../imesbouteilles';
import { ActivatedRoute } from '@angular/router';
import { FetchService } from '../fetch.service';



@Component({
  selector: 'app-notes',
  templateUrl: './notes.component.html',
  styleUrls: ['./notes.component.scss']
})
export class NotesComponent implements OnInit {

  lesEtoiles = [1, 2, 3, 4, 5];
  noteSelectionnee: number = 0;
  retour: any;

  bouteille: Imesbouteilles;

  @Input() uneBouteille: Imesbouteilles;


  constructor(
    private route: ActivatedRoute,
    public fetchService: FetchService,
  ) { }

  ngOnInit() {
    this.route.params.subscribe(params => {
      console.log(params);

      this.fetchService.showDetail(params['id']).subscribe((data: any) => {
        this.uneBouteille = data.data;
        this.noteSelectionnee = this.uneBouteille.notes;

        console.log(this.noteSelectionnee);

        console.log(this.uneBouteille);
      });

      // const id = params['id'];
      // if (id) {
      //   this.fetchBottleData(id);
      // }
    });



  }

  RecupererNote(notes: number) {
    console.log(this.uneBouteille);
    this.noteSelectionnee = notes;

    console.log('Note sélectionnée : ' + this.noteSelectionnee);
    
    this.uneBouteille.notes = this.noteSelectionnee;
    console.log(this.uneBouteille.notes);
    

    this.route.params.subscribe(params => {

      const bouteille = { ...this.uneBouteille, notes: this.noteSelectionnee };
      this.fetchService.ajoutNote(params['id'], bouteille).subscribe((data: any) => {
        this.retour = data.data;

        console.log(this.retour);
      });


    })
  }
}
