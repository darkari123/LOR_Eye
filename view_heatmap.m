model_image = zeros(336, 768);
%model_image(good_weights_idx) = svm_model.Beta';
%model_image(:) = svm_model.Beta(2:end);
model_image(good_weights_idx) = model.w;
colormap(fireice());
colormap_weights = imagesc(model_image);
colorbar;
%hmo = HeatMap(model_image);

