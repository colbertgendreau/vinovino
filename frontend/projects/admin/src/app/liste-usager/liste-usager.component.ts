import { Component, OnInit, ViewChild } from '@angular/core';
import { AdminService } from '../admin.service';
import { IUser } from '../iuser';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
// import { ModalComponent } from '../modal/modal.component';
import { ActivatedRoute } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatSort, Sort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { LiveAnnouncer } from '@angular/cdk/a11y';


@Component({
  selector: 'app-liste-usager',
  templateUrl: './liste-usager.component.html',
  styleUrls: ['./liste-usager.component.scss']
})

export class ListeUsagerComponent {

  utilisateur : IUser;
  utilisateurs : Array<IUser>;
  dataSource : MatTableDataSource<IUser>;
  colonnesAffichees : string[] = ['id', 'name', 'email', 'created_at', 'updated_at', 'modifier', 'supprimer'];
  @ViewChild(MatSort) sort: MatSort;

  constructor(private route:ActivatedRoute, private adminServ:AdminService, private snackBar: MatSnackBar, public dialog: MatDialog, private _liveAnnouncer: LiveAnnouncer) {
  }

  ngOnInit(): void {
    this.afficherListeUtilisateur();
  }

  afficherListeUtilisateur() {

    this.adminServ.getUtilisateur().subscribe((listeUtilisateur)=>{
      this.utilisateurs = listeUtilisateur.data;
      console.log(this.utilisateurs);
      this.utilisateurs.forEach(utilisateur => {
        console.log(utilisateur.name);
        console.log(utilisateur.created_at);
      });
      this.dataSource = new MatTableDataSource(this.utilisateurs);
      this.dataSource.sort = this.sort;
    });
  }

  // supprimer(utilisateur:IUser) {
  //   let dialogRef = this.dialog.open(ModalComponent, {data: {nom: utilisateur.name}});
  //   dialogRef.afterClosed().subscribe((retour:string) =>{
  //     console.log(retour);
  //     if(retour === 'false') {
  //       console.log('bière supprimée');
  //       this.adminServ.effacerUser(utilisateur.id).subscribe(result=>{
  //         console.log(result);
  //         this.afficherListeUtilisateur();
  //       });
  //     }
  //   });
  // }

  filtrer(event: Event) {
    const valeur = (event.target as HTMLInputElement).value;
    this.dataSource.filter = valeur.trim().toLowerCase();
  }

  announceSortChange(sortState: Sort) {   
    if (sortState.direction) {
      this._liveAnnouncer.announce(`Sorted ${sortState.direction}ending`);
    } else {
      this._liveAnnouncer.announce('Sorting cleared');
    }
  }

}
