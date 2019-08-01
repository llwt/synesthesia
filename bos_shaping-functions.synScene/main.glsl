float plot(vec2 st, float pct){
  return smoothstep( pct-0.02, pct, st.y) -
         smoothstep( pct, pct+0.02, st.y);
}

/**
 * Main Rendering Function
 * The vec4 return from this will be the pixel color for the current pass.
 */
vec4 renderMain() {
  /*
  vec2 st = gl_FragCoord.xy/u_resolution;
	gl_FragColor = vec4(st.x,st.y,0.0,1.0);
  */
  // vec2 st = vec2(_uv / RENDERSIZE);

  // return vec4(_uv.x, _uv.y, 0.0, 1.0);

  float y = pow(_uv.x, syn_BassLevel * 5);
  // float y = step(0.5, pow(_uv.x, syn_MidLevel * 5));

  vec3 color = vec3(y);

  // Plot a line
  float pct = plot(_uv, y);
  // color = (1.0-pct)*color + pct * vec3(0.0,1.0,0.0);
  color = (1.0-pct)*color + pct * vec3(0.0, syn_BassLevel, 0.0);

	return vec4(color,1.0);
}
