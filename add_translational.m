function mbs = add_translational(mbs, name, body1_name, body2_name, s1, s2)
p = inputParser;
is_2vec = @(x) isvector(x) && length(x) == 2;
addRequired(p, 'name', @isstring);
addRequired(p, 'body1_name', @isstring);
addRequired(p, 'body2_name', @isstring);
addRequired(p, 's1', is_2vec);
addRequired(p, 's2', is_2vec);
parse(p, name, body1_name, body2_name, s1, s2);

% Get bodies ids
b1 = get_body_id(mbs, body1_name);
b2 = get_body_id(mbs, body2_name);
rev = struct("name", name, "body1", b1, "s1", s1(:), "body2", b2, "s2", s2(:));
mbs.joints.translational = [mbs.joints.translational, rev];
mbs.nc = mbs.nc + 2;
end