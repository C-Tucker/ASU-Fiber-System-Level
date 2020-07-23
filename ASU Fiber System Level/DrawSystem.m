function DrawSystem(Boundaries,Fibers)
    %{
        This is currenlty a work in progress function and is not yet
        implimented
    %}

    figure();
    hold on;
    max = zeros(1,2);
    for i = Boundaries
        if( i.End > max)
            max = i.end;
        end
    end
    for i = Fibers
        if( i.End > max)
            max = i.end;
        end
    end
    
    rectangle('Position',[0,0,max(1),max(2)],'FaceColor','b');
    for i = Boundaries
        temp = i.End - i.Start + [.1,.1];
        rectangle('Position',[i.Start(1),i.Start(2),temp(1),temp(2)],'FaceColor','g');
    end
    for i = Fibers
        temp = i.End - i.Start + [.001,.001];
        rectangle('Position',[i.Start(1),i.Start(2),temp(1),temp(2)],'FaceColor','g');
    end
    hold off;
end

