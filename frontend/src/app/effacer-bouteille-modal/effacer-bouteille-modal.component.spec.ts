import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EffacerBouteilleModalComponent } from './effacer-bouteille-modal.component';

describe('EffacerBouteilleModalComponent', () => {
  let component: EffacerBouteilleModalComponent;
  let fixture: ComponentFixture<EffacerBouteilleModalComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EffacerBouteilleModalComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EffacerBouteilleModalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
