import { TestBed } from '@angular/core/testing';

import { GardienLoginAdminGuard } from './gardien-login-admin.guard';

describe('GardienLoginAdminGuard', () => {
  let guard: GardienLoginAdminGuard;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    guard = TestBed.inject(GardienLoginAdminGuard);
  });

  it('should be created', () => {
    expect(guard).toBeTruthy();
  });
});
