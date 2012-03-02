
// ARRI ALEXA IDT for ALEXA linear files
//  with camera EI set to 320
//  and CCT of adopted white set to 9000K
// Written by v2_IDT_maker.py v0.04 on Thursday 01 March 2012 by alex

const float EI = 320.0;
const float black = 256.0 / 65535.0;
const float exp_factor = 0.18 / (0.01 * (400.0/EI));

void main
(	input varying float rIn,
	input varying float gIn,
	input varying float bIn,
	input varying float aIn,
	output varying float rOut,
	output varying float gOut,
	output varying float bOut,
	output varying float aOut)
{

	// convert to white-balanced, black-subtracted linear values
	float r_lin = (rIn - black) * exp_factor;
	float g_lin = (gIn - black) * exp_factor;
	float b_lin = (bIn - black) * exp_factor;

	// convert to ACES primaries using CCT-dependent matrix
	rOut = r_lin * 0.839546 + g_lin * 0.176921 + b_lin * -0.016467;
	gOut = r_lin * 0.097104 + g_lin * 1.149298 + b_lin * -0.246402;
	bOut = r_lin * 0.049370 + g_lin * -0.263311 + b_lin * 1.213941;
	aOut = 1.0;

}
