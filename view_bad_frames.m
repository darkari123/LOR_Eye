fig = figure;
for i = 1 : length(bad_frames)
    mapper = zeros(size(bad_frames{i}));
    mapper(good_weights_idx) = 1;
    current_frame = repmat(bad_frames{i}*.75, 1, 1, 3);
    for y = 1:size(mapper,1)
        for x = 1:size(mapper,2)
            if mapper(y,x)
                current_frame(y,x,:) = [0 255 255];
%                 current_frame(y,x,:) = colormap_weights.CData(y,x);
            end
        end
    end
    
    fig = imshow(current_frame);
    disp(bad_match_frame_idx(i));
    fprintf('Press a key to continue');
    pause;
end