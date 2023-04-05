import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { IBouteille } from './ibouteille';
import { IlisteBouteille } from './iliste-bouteille';
import { environment } from "../environments/environment";
import { ICellier } from './icellier';
import { IlisteCellier } from './iliste-cellier';
import { Ilistemesbouteilles } from './ilistemesbouteilles';
import { Imesbouteilles } from './imesbouteilles';

@Injectable({
  providedIn: 'root'
})
export class FetchService {

  // Important: Ne pas utilsier http://127.0.0.1:800, à la place utiliser
  // private urlBouteille:string = environment.apiUrl+"/api/bouteilles";

  private urlBouteille: string = environment.apiUrl + "/api/bouteilles";
  private url: string = environment.apiUrl + "/api/bouteillesSAQ";
  private urlCellier: string = environment.apiUrl + "/api/celliers";
  private urlScanner: string = environment.apiUrl + "/api/scannerDetail";

  /**
   * Construteur de la classe FetchService
   */
  constructor(private http: HttpClient) { }

  /**
   * Fonction qui retourne les bouteilles de la SAQ
   * @returns Liste de bouteilles de la SAQ
   */
  getBouteilleSAQ(): Observable<IlisteBouteille> {
    return this.http.get<IlisteBouteille>(this.url);
  }

  /**
   * Fonction qui ajoute une bouteille
   * @param bouteille Imesbouteilles - Une bouteille
   * @returns Bouteille ajoutée
   */
  ajoutBouteille(bouteille: Imesbouteilles): Observable<Imesbouteilles> {
    return this.http.post<Imesbouteilles>(this.urlBouteille, bouteille);
  }

  /**
   * Fonction qui modifie une bouteille que l'utilisateur a lui-même entrée
   * @param id nombre - L'id du cellier de la bouteille
   * @param bouteille any - Bouteille modifiée
   * @returns Bouteille modifiée
   */
  modifBouteille(id: number, bouteille: any): Observable<Imesbouteilles> {
    return this.http.put<Imesbouteilles>(this.urlBouteille + "/" + id, bouteille);
  }

  /**
   * Fonction qui affiche une bouteille
   * @param id nombre - L'id de la bouteille
   * @returns Bouteille affichée
   */
  showBouteille(id: number): Observable<Imesbouteilles> {
    return this.http.get<Imesbouteilles>(this.urlBouteille + "/" + id);
  }

  /**
   * Fonction qui affiche les bouteilles d'un cellier en particulier (à partir de l'id du cellier)
   * @param id nombre - L'id du cellier
   * @returns Bouteilles d'un cellier
   */
  getBouteillesCellier(id: number): Observable<Ilistemesbouteilles> {
    return this.http.get<Ilistemesbouteilles>(this.urlCellier + "/" + id);
  }

  /**
   * Fonction qui affiche toutes les bouteilles d'un utilisateur
   * @returns Toutes les bouteilles d'un usager
   */
  getMesBouteilles(): Observable<Ilistemesbouteilles> {
    return this.http.get<Ilistemesbouteilles>(this.urlBouteille);
  }

  /**
   * Fonction qui affiche tous les celliers d'un utilisateur
   * @returns Tous les celliers
   */
  getCelliers(): Observable<IlisteCellier> {
    return this.http.get<IlisteCellier>(this.urlCellier);
  }

  /**
   * Fonction qui ajoute un cellier
   * @param cellier ICellier - Cellier ajouté
   * @returns Cellier ajouté
   */
  ajoutCellier(cellier: ICellier): Observable<ICellier> {
    return this.http.post<ICellier>(this.urlCellier, cellier);
  }

  /**
   * Fonction qui retourne un cellier à partir de l'id du cellier
   * @param id nombre - L'id du cellier
   * @returns Cellier affiché
   */
  getUnCellier(id: number): Observable<ICellier> {
    return this.http.get<ICellier>(this.urlCellier + "/" + id);
  }

  /**
   * Fonction qui modifie un cellier à partir de son id
   * @param id nombre - L'id du cellier
   * @param cellier ICellier - Cellier modifié
   * @returns Cellier modifié
   */
  modifCellier(id: number, cellier: ICellier): Observable<ICellier> {
    return this.http.put<ICellier>(this.urlCellier + "/" + id, cellier);
  }

  /**
   * Fonction qui affiche un cellier
   * @param id nombre - L'id du cellier
   * @returns Affichage d'un cellier
   */
  showCellier(id: number): Observable<ICellier> {
    return this.http.get<ICellier>(environment.apiUrl + "/api/show/" + id);
  }

  /**
   * Fonction qui supprime un cellier
   * @param id nombre - L'id du cellier à supprimer
   * @returns Cellier supprimé
   */
  supprimerCellier(id: number): Observable<ICellier> {
    return this.http.delete<ICellier>(this.urlCellier + "/" + id);
  }

  /**
   * Fonction qui supprime une bouteille
   * @param id nombre - L'id de la bouteille à supprimer
   * @returns Bouteille supprimée
   */
  supprimerBouteille(id: number): Observable<Imesbouteilles> {
    return this.http.delete<Imesbouteilles>(this.urlBouteille + "/" + id);
  }

  /**
   * Fonction qui affiche le détails d'une bouteille à partir de son id
   * @param id nombre - L'id de la bouteille
   * @returns Détails d'une bouteille
   */
  showDetail(id: number): Observable<Imesbouteilles> {
    return this.http.get<Imesbouteilles>(environment.apiUrl + "/api/showDetail/" + id);
  }

  /**
   * Fonction qui utilise le scanner
   * @param codeCup any
   * @returns Code barre du scanner
   */
  scannerDetail(codeCup: any): Observable<IBouteille> {
    return this.http.get<IBouteille>(this.urlScanner + '/' + codeCup);
  }

  /**
   * Fonction qui ajoute une note sur une bouteille
   * @param id nombre - L'id de la note
   * @param bouteille Imesbouteilles - Bouteille sur laquelle on ajoute une note
   * @returns Note ajoutée
   */
  ajoutNote(id: number, bouteille: Imesbouteilles): Observable<Imesbouteilles> {
    return this.http.put<Imesbouteilles>(environment.apiUrl + "/api/ajoutNote/" + id, bouteille);
  }

  /**
   * Fonction qui ajoute un commentaire sur une bouteille
   * @param id nombre - L'id du commentaire
   * @param bouteille Imesbouteilles - Bouteille sur laquelle on ajoute un commentaire
   * @returns Commentaire ajouté
   */
  ajoutCommentaire(id: number, bouteille: Imesbouteilles): Observable<Imesbouteilles> {
    return this.http.put<Imesbouteilles>(environment.apiUrl + "/api/ajoutCommentaire/" + id, bouteille);
  }
}