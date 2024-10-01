function hl = scalebar_3d(hax, xc,yc,zc, w)
  x = [xc, xc-w, nan, xc, xc  , nan, xc, xc  ];
  y = [yc, yc  , nan, yc, yc-w, nan, yc, yc  ];
  z = [zc, zc  , nan, zc, zc  , nan, zc, zc+w];    
  hl = line(hax, x,y,z);
end
