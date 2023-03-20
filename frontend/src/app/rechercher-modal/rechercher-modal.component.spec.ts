import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RechercherModalComponent } from './rechercher-modal.component';

describe('RechercherModalComponent', () => {
  let component: RechercherModalComponent;
  let fixture: ComponentFixture<RechercherModalComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RechercherModalComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RechercherModalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
