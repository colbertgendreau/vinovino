import { Injectable } from "@angular/core";
import { HttpInterceptor, HttpRequest, HttpHandler } from "@angular/common/http";
import { TokenService } from "./token.service";
@Injectable()
export class AuthInterceptor implements HttpInterceptor {
  constructor(private tokenService: TokenService) { }

  /**
   * Interception de toutes les requêtes HTTP sortantes pour inclure le token d'authentification dans le header de la requête sous la forme d'une chaine de caractères "Bearer <token>"
   * @param {HttpRequest<any>} req - La requête HTTP sortante à intercepter
   * @param {HttpHandler} next - Le gestionnaire pour envoyer la requête interceptée
   * @returns {Observable<HttpEvent<any>>} La réponse HTTP interceptée
   */
  intercept(req: HttpRequest<any>, next: HttpHandler) {
    const accessToken = this.tokenService.getToken();
    req = req.clone({
      setHeaders: {
        Authorization: "Bearer " + accessToken
      }
    });
    return next.handle(req);
  }
}
