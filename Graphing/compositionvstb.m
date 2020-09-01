function compositionvstb;
clc;
clearvars;

[composition, ~, ~, ~, stbmatrix, err] = gatherVideoData();

figure;
compvstb = bar(stbmatrix,'FaceColor','flat');
compvstb(1).FaceColor = 'b';
compvstb(2).FaceColor = 'g';
compvstb(3).FaceColor = 'yellow';
compvstb(4).FaceColor = 'r';
hold on;
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
set(gcf,'color','w');
drawnow;

set(gca,'xtick',1:size(unique(composition)),'xticklabel',unique(composition,'stable'));
set(gca,'FontSize',24);
xlabel('Composition (polymer wt% - nanoparticle wt%)','FontSize',26);
ylabel('Average Strain to Break (%)','FontSize',26);
title('Trends in Strain to Break','FontSize',40);

ngroups = size(stbmatrix, 1);
nbars = size(stbmatrix, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, stbmatrix(:,i), err(:,i), '.', 'LineWidth',2,'Color','k');
end

lgd = legend({'Strain Rate 6', 'Strain Rate 18', 'Strain Rate 36', 'Strain Rate 72'},'Position',[.15,.7,.1,.2],'FontSize',20);

% text(ones(size(avgstb)), avgstb, strainrate, 'HorizontalAlignment','center', 'VerticalAlignment','bottom')

message = msgbox('Graphing is done');
end
	