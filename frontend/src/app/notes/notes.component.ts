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

      this.fetchService.showDetail(params['id']).subscribe((data: any) => {

        this.uneBouteille = data.data;
        this.noteSelectionnee = this.uneBouteille.notes;

      });

    });

  }

  /**
 * Ajoute ou modifie une note à une bouteille et envoie une requête de mise à jour via un service.
 * @param note La note à ajouter à la bouteille.
 */
  RecupererNote(notes: number) {

    this.noteSelectionnee = notes;
    this.uneBouteille.notes = this.noteSelectionnee;

    this.route.params.subscribe(params => {

      const bouteille = { ...this.uneBouteille, notes: this.noteSelectionnee };
      this.fetchService.ajoutNote(params['id'], bouteille).subscribe((data: any) => {
        this.retour = data.data;

      });

    })
  }
}
