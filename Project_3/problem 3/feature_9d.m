function get9Dfeature=feature_9d()

%%%%%%%%%% take 1 picture, get 9-D feature vector %%%%%%%%%%%%%%%
tex1feat(:,:,1)=feature_image(E5E5,texture1);
tex1feat(:,:,2)=feature_image(E5S5,texture1);
tex1feat(:,:,3)=feature_image(E5W5,texture1);

tex1feat(:,:,4)=feature_image(W5E5,texture1);
tex1feat(:,:,5)=feature_image(W5S5,texture1);
tex1feat(:,:,6)=feature_image(W5W5,texture1);

tex1feat(:,:,7)=feature_image(S5S5,texture1);
tex1feat(:,:,8)=feature_image(S5E5,texture1);
tex1feat(:,:,9)=feature_image(S5W5,texture1);