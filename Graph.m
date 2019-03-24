classdef Graph < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure         matlab.ui.Figure
        PushButton       matlab.ui.control.Button
        UIAxes           matlab.ui.control.UIAxes
        nEditFieldLabel  matlab.ui.control.Label
        nEditField       matlab.ui.control.NumericEditField
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: PushButton
        function PushButtonPushed(app, event)
            x=-100:100
                y=x.^app.nEditField.Value
            plot(app.UIAxes,x,y,'linewidth',8)
            
       
        end

        % Value changed function: nEditField
        function nEditFieldValueChanged2(app, event)
            value = app.nEditField.Value;
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [1 1 1];
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'UI Figure';

            % Create PushButton
            app.PushButton = uibutton(app.UIFigure, 'push');
            app.PushButton.ButtonPushedFcn = createCallbackFcn(app, @PushButtonPushed, true);
            app.PushButton.BackgroundColor = [1 0.4118 0.1608];
            app.PushButton.FontName = 'Futura';
            app.PushButton.FontWeight = 'bold';
            app.PushButton.Position = [271 54 100 23];
            app.PushButton.Text = 'Push';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Graph')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            app.UIAxes.FontName = 'Futura';
            app.UIAxes.FontWeight = 'bold';
            app.UIAxes.ColorOrder = [0 0 0;0.851 0.3255 0.098;0.9294 0.6941 0.1255;0.4941 0.1843 0.5569;0.4667 0.6745 0.1882;0.302 0.7451 0.9333;0.6353 0.0784 0.1843];
            app.UIAxes.ColorOrderIndex = 2;
            app.UIAxes.Box = 'on';
            app.UIAxes.LineWidth = 2;
            app.UIAxes.Color = [0.851 0.3255 0.098];
            app.UIAxes.XGrid = 'on';
            app.UIAxes.YGrid = 'on';
            app.UIAxes.ZGrid = 'on';
            app.UIAxes.Projection = 'perspective';
            app.UIAxes.BackgroundColor = [1 1 1];
            app.UIAxes.Position = [42 111 557 349];

            % Create nEditFieldLabel
            app.nEditFieldLabel = uilabel(app.UIFigure);
            app.nEditFieldLabel.BackgroundColor = [1 1 1];
            app.nEditFieldLabel.HorizontalAlignment = 'right';
            app.nEditFieldLabel.FontName = 'Futura';
            app.nEditFieldLabel.FontWeight = 'bold';
            app.nEditFieldLabel.Position = [59 76 25 22];
            app.nEditFieldLabel.Text = 'n';

            % Create nEditField
            app.nEditField = uieditfield(app.UIFigure, 'numeric');
            app.nEditField.ValueChangedFcn = createCallbackFcn(app, @nEditFieldValueChanged2, true);
            app.nEditField.FontName = 'Futura';
            app.nEditField.FontWeight = 'bold';
            app.nEditField.Position = [99 76 100 22];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Graph

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end