module HS
  class Base

    class << self

      # ROTATION HELPERS
      def landscape_left?
        Device.interface_orientation == :landscape_left
      end

      def landscape_right?
        Device.interface_orientation == :landscape_right
      end

      def right_side_up?
        Device.interface_orientation == :portrait
      end

      def upside_down?
        Device.interface_orientation == :portrait_upside_down
      end

      def landscape?
        landscape_left? || landscape_right?
      end

      def portrait?
        right_side_up?
      end

      def rotation_width(orientation = Device.interface_orientation)
        Device.screen.width_for_orientation(orientation)
      end

      def rotation_height(orientation = Device.interface_orientation)
        Device.screen.height_for_orientation(orientation)
      end
      
      def rotation_transform
        transform = 0.degrees
        if landscape_left?
          transform = 270.degrees
        elsif landscape_right?
          transform = 90.degrees
        end

        CGAffineTransformMakeRotation(transform)
      end

      def orientation
        if landscape_left?(Device.interface_orientation)
          UIInterfaceOrientationLandscapeLeft
        elsif landscape_right?(Device.interface_orientation)
          UIInterfaceOrientationLandscapeRight
        else
          UIInterfaceOrientationPortrait
        end
      end

      # INTERNET HELPERS
      def reachable?
        Reachability.reachabilityForInternetConnection.isReachable
      end

      # MISC HELPERS
      def keyboard_height 
        Device.ipad? ? 264 : 216
      end

      def aspect_height_from(old_height, old_width:old_width, width:width)
        old_height.to_f / old_width.to_f * width
      end

      def aspect_size_from(old_height, old_width:old_width, width:width)
        height = old_height.to_f / old_width.to_f * width
        [width, height]
      end

      def app_inactive?
        App.shared.applicationState != UIApplicationStateActive
      end

      def ios_7?
        Device.ios_version.to_i >= 7
      end

      def ios_6?
        Device.ios_version.to_i >= 6
      end

    end
  end
end