classdef app2_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure         matlab.ui.Figure
        DisplayButton    matlab.ui.control.Button
        UIAxes           matlab.ui.control.UIAxes
        XEditFieldLabel  matlab.ui.control.Label
        XEditField       matlab.ui.control.NumericEditField
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: DisplayButton
        function DisplayButtonPushed(app, event)
            x=-100:100
                y=x.^app.XEditField.Value
            plot(app.UIAxes,x,y,'linewidth',8)
            
       
        end

        % Value changed function: XEditField
        function XEditFieldValueChanged2(app, event)
            value = app.XEditField.Value;
            
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

            % Create DisplayButton
            app.DisplayButton = uibutton(app.UIFigure, 'push');
            app.DisplayButton.ButtonPushedFcn = createCallbackFcn(app, @DisplayButtonPushed, true);
            app.DisplayButton.BackgroundColor = [1 0.4118 0.1608];
            app.DisplayButton.FontName = 'Futura';
            app.DisplayButton.FontWeight = 'bold';
            app.DisplayButton.Position = [271 54 100 23];
            app.DisplayButton.Text = 'Display';

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

            % Create XEditFieldLabel
            app.XEditFieldLabel = uilabel(app.UIFigure);
            app.XEditFieldLabel.BackgroundColor = [1 1 1];
            app.XEditFieldLabel.HorizontalAlignment = 'right';
            app.XEditFieldLabel.FontName = 'Futura';
            app.XEditFieldLabel.FontWeight = 'bold';
            app.XEditFieldLabel.Position = [59 76 25 22];
            app.XEditFieldLabel.Text = 'X';

            % Create XEditField
            app.XEditField = uieditfield(app.UIFigure, 'numeric');
            app.XEditField.ValueChangedFcn = createCallbackFcn(app, @XEditFieldValueChanged2, true);
            app.XEditField.FontName = 'Futura';
            app.XEditField.FontWeight = 'bold';
            app.XEditField.Position = [99 76 100 22];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app2_exported

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