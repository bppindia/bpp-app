String getStateFromCoordinates(double x, double y) {
  // North India
  if (y < 0.3) {
    if (x < 0.3) return 'Jammu & Kashmir';
    if (x < 0.4) return 'Himachal Pradesh';
    if (x < 0.5) return 'Uttarakhand';
    if (x > 0.7) return 'Arunachal Pradesh';
    return 'Other Northern States';
  }

  // Central India
  if (y < 0.5) {
    if (x < 0.3) return 'Punjab';
    if (x < 0.4) return 'Haryana';
    if (x < 0.5) return 'Uttar Pradesh';
    if (x < 0.6) return 'Bihar';
    if (x > 0.7) return 'Assam';
    return 'Other Central States';
  }

  // Western India
  if (x < 0.3 && y < 0.7) return 'Gujarat';
  if (x < 0.4 && y < 0.7) return 'Rajasthan';
  if (x < 0.5 && y < 0.7) return 'Madhya Pradesh';

  // Eastern India
  if (x > 0.7 && y < 0.7) return 'West Bengal';
  if (x > 0.6 && y < 0.7) return 'Odisha';

  // Southern India
  if (y > 0.7) {
    if (x < 0.4) return 'Kerala';
    if (x < 0.5) return 'Karnataka';
    if (x < 0.6) return 'Tamil Nadu';
    if (x < 0.7) return 'Andhra Pradesh';
    return 'Other Southern States';
  }

  return 'State not found';
}
