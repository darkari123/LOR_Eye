% Read in video files (to be saved to permanent storage)

close all

directory = 'D:/ML_Project/';
filename = 'DOT-R3_1.avi';

fullpath = strcat(directory, filename);

obj = VideoReader(fullpath);
nframe = 0;
thisframe = cell(1);
tic

% reading in the signal
[s p i] = uigetfile('*.mat');
d = load([p s]);
% d = d.Recording;
d = d.InvalidSamples;

sampleIndex = 0;
while (hasFrame(obj) && sampleIndex < length(d))
    sampleIndex = sampleIndex + 1;
    f = readFrame(obj);
    if(d(sampleIndex))
        continue;
    end
    if(mod(nframe,100)==0)
        disp(nframe+1)
    end
    nframe = nframe + 1;
    
%     % Calculate mean intensity value from RGB components
%     thisframe{nframe}(:, :, 1) = mean(thisframe{nframe}(:, :, :), 3);
%     % Get rid of other components (-> grayscale)
%     thisframe{nframe}(:, :, 2:3) = [];
    % Convert RGB to grayscale 
    f = rgb2gray(f);
%     f = f(:,end+1-size(f,1):end);
    f = f(768/3-10:end-1-768/3+70,end+1-size(f,1):end);
    % Only extract right half (1280+) of the video
%     thisframe{nframe}(:, 1:1280) = [];
%     thisframe{nframe} = [1 f(:)'];
    thisframe{nframe} = f;
    
    
%     thisfig = figure();
%     thisax = axes('Parent', thisfig);
%     image(thisframe, 'Parent', thisax);
%     title(thisax, sprintf('Frame #%d', nframe));
end
toc


[s p i] = uigetfile([p '*.avi']);
obj = VideoReader([p s]);
while (hasFrame(obj) && sampleIndex < length(d))
    sampleIndex = sampleIndex + 1;
    f = readFrame(obj);
    if(d(sampleIndex))
        continue;
    end
    if(mod(nframe,100)==0)
        disp(nframe+1)
    end
    nframe = nframe + 1;
    
%     % Calculate mean intensity value from RGB components
%     thisframe{nframe}(:, :, 1) = mean(thisframe{nframe}(:, :, :), 3);
%     % Get rid of other components (-> grayscale)
%     thisframe{nframe}(:, :, 2:3) = [];
    % Convert RGB to grayscale
    f = rgb2gray(f);
    f = f(768/3-10:end-1-768/3+70,end+1-size(f,1):end);
    % Only extract right half (1280+) of the video
%     thisframe{nframe}(:, 1:1280) = [];
%     thisframe{nframe} = [1 f(:)'];
    thisframe{nframe} = f;
    
    
    
%     thisfig = figure();
%     thisax = axes('Parent', thisfig);
%     image(thisframe, 'Parent', thisax);
%     title(thisax, sprintf('Frame #%d', nframe));
end
toc



% tic
% % nsamples = min(length(thisframe), length(t));
% nsamples = size(thisframe,2)
% Xeye = ones(nsamples,numel(thisframe{1}), 'uint8');
% for i = 1 : nsamples
%     if(mod(i,100)==0)
%         disp(i)
%     end
%     Xeye(i, :) = thisframe{i}(:)';
%     %thisframe(i) = []; % Remove frame from memory to conserve space
%     %sprintf('Frame %d of %d\n', [i; length(thisframe)]);
% end
% toc

% save([p 'Xeye.mat'],'Xeye','-v7.3');
save([p 'video.mat'], 'thisframe', '-v7.3');