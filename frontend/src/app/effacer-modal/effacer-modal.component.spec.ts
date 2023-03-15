import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EffacerModalComponent } from './effacer-modal.component';

describe('EffacerModalComponent', () => {
  let component: EffacerModalComponent;
  let fixture: ComponentFixture<EffacerModalComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EffacerModalComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EffacerModalComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
