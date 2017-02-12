%% MATLAB Recipes for Earth Sciences - Chapter 3%% Section 3.3clear%%corg = load('organicmatter_one.txt');%%plot(corg,zeros(1,length(corg)),'o')%%nbin = round(sqrt(length(corg)))%%vmin = min(corg) + 0.5*range(corg)/nbin;vmax = max(corg) - 0.5*range(corg)/nbin;vwth = range(corg)/nbin;v = vmin : vwth : vmax%%emin = min(corg);emax = max(corg);ewth = range(corg)/nbin;e = emin : ewth : emax%%for i = 1 : nbin   if i < nbin   corgb = corg(emin+(i-1)*ewth<=corg & emin+i*ewth>corg);   n(i) = length(corgb);   else   corgb = corg(emin+(i-1)*ewth<=corg & emin+i*ewth>=corg);   n(i) = length(corgb);   end         endn%%histogram(corg)%%h = histogram(corg)%%v = h.BinWidth * 0.5 + h.BinEdges(1:end-1)n = h.Values%%h = histogram(corg,e);v = h.BinWidth * 0.5 + h.BinEdges(1:end-1)n = h.Values%%[n,e] = histcounts(corg,e)v = diff(e(1:2)) * 0.5 + e(1:end-1)%%cdfplot(corg)%%mean(corg)%%median(corg)%%quantile(corg,[.25 .50 .75])%%v(find(n == max(n)))%%v(n == max(n))%%boxplot(corg)%%range(corg)%%var(corg)%%std(corg)%%skewness(corg)%%kurtosis(corg)%%corg(25,1) = NaN;%%mean(corg)%%nanmean(corg)%%clear%%sodium = load('sodiumcontent_one.txt');%%h = histogram(sodium,11)v = h.BinWidth * 0.5 + h.BinEdges(1:end-1)n = h.Values%%mean(sodium)%%median(sodium)%%v(find(n == max(n)))%%skewness(sodium)%%clear%%sodium = load('sodiumcontent_two.txt');%%h = histogram(sodium,7)v = h.BinWidth * 0.5 + h.BinEdges(1:end-1)n = h.Values%%mean(sodium)%%median(sodium)%%v(find(n == max(n)))%%sodium(51,1) = 7.0;%%h = histogram(sodium,11)v = h.BinWidth * 0.5 + h.BinEdges(1:end-1)n = h.Values%%mean(sodium)%%median(sodium)%%v(find(n == max(n)))%% Section 3.5clear%%randtool%%disttool%%clear%%mu = 12.3448;sigma = 1.1660;%%x = 5 : 0.001 : 20;pdf = normpdf(x,mu,sigma);cdf = normcdf(x,mu,sigma);plot(x,pdf,x,cdf)%%pdf = pdf / sum(pdf);sum(pdf(find(x>mu-sigma,1,'first'):find(x<mu+sigma,1,'last')))sum(pdf(find(x==mu-sigma):find(x==mu+sigma)))%%cdf(find(x<mu+sigma,1,'last'))-cdf(find(x>mu-sigma,1,'first'))cdf(find(x==mu+sigma))-cdf(find(x==mu-sigma))%%norminv((1-0.6827)/2,mu,sigma)norminv(1-(1-0.6827)/2,mu,sigma)%%sum(pdf(find(x>mu-2*sigma,1,'first'):find(x<mu+2*sigma,1,'last')))sum(pdf(find(x>mu-3*sigma,1,'first'):find(x<mu+3*sigma,1,'last')))%%norminv(0.05/2,mu,sigma)norminv(1-0.05/2,mu,sigma)%%norminv(0.01/2,mu,sigma)norminv(1-0.01/2,mu,sigma)%%clearmu = 12.3448;sigma = 1.1660;%%pd = makedist('normal',mu,sigma)%%y = icdf(pd,[(1-0.6827)/2,1-(1-0.6827)/2])%%p = normspec(y,mu,sigma,'inside')%% Section 3.6clear%%pd = makedist('normal',0,1)y = icdf(pd,[0,.95]);[p,h] = normspec(y,0,1,'outside');%%clear%%pd = makedist('normal',0,1)y = icdf(pd,[.025,.975]);[p,h] = normspec(y,0,1,'outside');%% Section 3.7clear%%load('organicmatter_two.mat');%%histogram(corg1,'FaceColor','b'), hold onhistogram(corg2,'FaceColor','r'), hold off%%na = length(corg1); nb = length(corg2);ma = mean(corg1); mb = mean(corg2);sa = std(corg1); sb = std(corg2);%%tcalc = abs((ma-mb))/sqrt(((na+nb)/(na*nb)) * ...    (((na-1)*sa^2+(nb-1)*sb^2)/(na+nb-2)))%%tcrit = tinv(1-0.05/2,na+nb-2)%%[h,p,ci,stats] = ttest2(corg1,corg2,0.05)%%clear%%load('organicmatter_three.mat');%%histogram(corg1,'FaceColor','b'), hold onhistogram(corg2,'FaceColor','r'), hold off%%na = length(corg1); nb = length(corg2);ma = mean(corg1); mb = mean(corg2);sa = std(corg1); sb = std(corg2);%%tcalc = abs((ma-mb))/sqrt(((na+nb)/(na*nb)) * ...    (((na-1)*sa^2+(nb-1)*sb^2)/(na+nb-2)))%%tcrit = tinv(1-0.05/2,na+nb-2)%%[h,p,ci,stats] = ttest2(corg1,corg2,0.05)%% Section 3.8clear%%load('organicmatter_four.mat');%%s1 = std(corg1)s2 = std(corg2)%%df1 = length(corg1) - 1df2 = length(corg2) - 1%%if s1 > s2slarger = s1ssmaller = s2elseslarger = s2ssmaller = s1end%%Fcalc = slarger^2 / ssmaller^2Fcrit = finv(1-0.05/2,df1,df2)%%[h,p,ci,stats] = vartest2(corg1,corg2,0.05)%%clear%%load('organicmatter_five.mat');%%s1 = std(corg1);s2 = std(corg2);%%df1 = length(corg1) - 1;df2 = length(corg2) - 1;%%if s1 > s2slarger = s1;ssmaller = s2;elseslarger = s2;ssmaller = s1;end%%Fcalc = slarger^2 / ssmaller^2Fcrit = finv(1-0.05/2,df1,df2)%%[h,p,ci,stats] = vartest2(corg1,corg2,0.05)%% Section 3.9clear%%corg = load('organicmatter_one.txt');%%h = histogram(corg,8);v = h.BinWidth * 0.5 + h.BinEdges(1:end-1);n_obs = h.Values;%%n_exp = normpdf(v,mean(corg),std(corg));%%n_exp = n_exp / sum(n_exp);n_exp = sum(n_obs) * n_exp;%%subplot(1,2,1), bar(v,n_obs,'r')subplot(1,2,2), bar(v,n_exp,'b')%%normplot(corg)%%chi2calc = sum((n_obs - n_exp).^2 ./ n_exp)%%chi2crit = chi2inv(1-0.05,5)%%[h,p,stats] = chi2gof(corg)%% Section 3.10clear%%corg = load('organicmatter_one.txt');%%corg = (corg-mean(corg))/std(corg);%%[cn_obs,x] = ecdf(corg);%%cn_exp = normcdf(x,0,1);%%kscalc = max(cn_obs-normcdf(x,0,1))%%plot(x,cn_obs,'b'), hold onplot(x,normcdf(x,0,1),'r')plot(x(find((cn_obs-normcdf(x,0,1))== ...    max(cn_obs-normcdf(x,0,1))))*ones(2,1),[0 1],'k:')%%kscrit = 1.36/length(corg)^0.5%%[h,p,stats,cv] = kstest(corg)%% Section 3.11clear%%data1 = [5 5 8 9 13 13 13 15];data2 = [3 3 4 5 5 8 10 16];%%data = horzcat(data1,data2);data = sort(data)%%n1 = length(data1);n2 = length(data2);L = 1 : length(data)%%[C,ia,ic] = unique(data);%%nties = 0;dties = 0;kties = 0;%%j = 1;for i = 1 : length(ia)    f = find(ic==i);    if length(f) > 1        dties(j) = max(data(f));        nties = nties+1;        j = j + 1;    end    icf(f) = mean(L(f));endicf%%icf = tiedrank(data)%%for i = 1 : nties    kties(i) = sum(data == dties(i));end%%ntiesdtieskties%%[Lia1,locb1] = ismember(data1,data);r1 = icf(locb1);R1 = sum(r1)[Lia2,locb2] = ismember(data2,data);r2 = icf(locb2);R2 = sum(r2)%%U1 = n1*n2 + n1*(n1+1)/2 - R1U2 = n1*n2 + n2*(n2+1)/2 - R2U = min([U1 U2])%%t = 0;S = n1 + n2;for i = 1 : nties    t(i) = (kties(i)^3 - kties(i)) / 12;endT = sum(t);zcal = abs(U - n1*n2/2) / sqrt( (n1*n2/(S*(S-1))) * ((S^3-S)/12 - T))%%zcrit = norminv(1-0.05/2,0,1)%%[P,H,STATS] = ranksum(data1,data2)%%clear%%load('organicmatter_two.mat');%%[P,H,STATS] = ranksum(corg1,corg2)%% Section 3.12clear%%data1 = [7 14 22 36 40 48 49 52];data2 = [3 5 6 10 17 18 20 39];%%data1 = data1 - median(data1);data2 = data2 - median(data2);%%data = horzcat(data1,data2);data = sort(data)%%n1 = length(data1);n2 = length(data2);n = n1 + n2;%%V1 = ismember(data,data1)V2 = ismember(data,data2)%% L = 1 : length(data);%%An = sum(((n+1)/2 - abs(L - (n+1)/2)).* V1)%%[h,p,stats] = ansaribradley(data1,data2)%%clear%%rng(0)data1 = 3.4 + rand(1,100);data2 = 4.3 + rand(1,100);%%data1(1,50:55) = 2.5;data2(1,25:28) = 2.5;%%data1 = data1 - median(data1);data2 = data2 - median(data2);%%data = horzcat(data1,data2);data = sort(data);%%icf = tiedrank(data,0,1);%%An = sum(icf(ismember(data,data1)))%%n1 = length(data1);n2 = length(data2);n = n1 + n2;%%V1 = ismember(data,data1);V2 = ismember(data,data2);%%An = sum(((n+1)/2 - abs(icf - (n+1)/2)).* V1)%%if mod(n,2) == 0   display('n is even')   muAn = 0.25 * n1 * (n+2);   siAn = n1*n2*(n^2-4)/((48*(n-1)));else   display('n is odd')   muAn = 0.25 * n1 * (n+1)^2/n;   siAn = n1*n2*(n+1)*(n^2+3)/(48*n^2);end%%zcalc = (An - muAn)/sqrt(siAn)%%zcrit = norminv(1-0.05/2,0,1)%%[h,p,stats] = ansaribradley(data1,data2)%%clear%%load('organicmatter_four.mat');%%[h,p,stats] = ansaribradley(corg1,corg2)%% Section 3.13clear%%rng(0)data = 6.4 + 1.4*randn(100,1);%%e = 1.5 : 10.5;h = histogram(data,e);v = h.BinWidth * 0.5 + h.BinEdges(1:end-1);n = h.Values;%%[muhat,sigmahat] = normfit(data)%%x = 2 : 1/20 : 10;y = normpdf(x,muhat,sigmahat);y = trapz(v,n) * y/trapz(x,y);bar(v,n), hold on, plot(x,y,'r'), hold off%%phat = mle(data,'distribution','normal');%%x = 2 : 1/20 : 10;y = normpdf(x,phat(:,1),phat(:,2));y = trapz(v,n) * y/trapz(x,y);%%bar(v,n), hold on, plot(x,y,'r'), hold off%%clearrng(0)ya = 6.4 + 1.4*randn(100,1);yb = 13.3 + 1.8*randn(100,1);data = vertcat(ya,yb);%%e = -0.5 : 30.5;h = histogram(data,e);v = h.BinWidth * 0.5 + h.BinEdges(1:end-1);n = h.Values;%%gmfit = gmdistribution.fit(data,2)%%x = 0 : 1/30 : 20;y1 = normpdf(x,gmfit.mu(1,1),gmfit.Sigma(:,:,1));y2 = normpdf(x,gmfit.mu(2,1),gmfit.Sigma(:,:,2));%%y1 = gmfit.PComponents(1,1) * y1/trapz(x,y1);y2 = gmfit.PComponents(1,2) * y2/trapz(x,y2);%%y = y1 + y2;y = trapz(v,n) * y/trapz(x(1:10:end),y(1:10:end));%%bar(v,n), hold on, plot(x,y,'r'), hold off