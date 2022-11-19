<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" minScale="0" labelsEnabled="1" simplifyAlgorithm="0" simplifyLocal="1" simplifyMaxScale="1" simplifyDrawingTol="1" styleCategories="AllStyleCategories" readOnly="0" simplifyDrawingHints="0" hasScaleBasedVisibilityFlag="0" version="3.10.9-A Coruña">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 forceraster="0" type="RuleRenderer" enableorderby="0" symbollevels="0">
    <rules key="{9b549ecf-d391-4336-8bc3-9ebdad235292}">
      <rule symbol="0" label="unite complete" key="{b0708ec7-c5f8-4b2b-8074-318a01083e21}" filter=" &quot;type&quot; &lt;> '_na' AND &quot;incomplet&quot; &lt;> 1"/>
      <rule symbol="1" checkstate="0" label="unite incomplete" key="{975f1e6f-82f6-4814-9093-b4ca282ca488}" filter=" &quot;type&quot; &lt;> '_na' AND &quot;incomplet&quot; = 1"/>
      <rule symbol="2" checkstate="0" label="partie manquante (_na)" key="{62344f94-3e41-4d50-aa12-39a4f9dfb05b}" filter=" &quot;type&quot; = '_na'"/>
    </rules>
    <symbols>
      <symbol force_rhr="0" type="marker" name="0" clip_to_extent="1" alpha="1">
        <layer class="SimpleMarker" locked="0" enabled="1" pass="0">
          <prop k="angle" v="90"/>
          <prop k="color" v="255,129,0,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="255,129,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" type="marker" name="1" clip_to_extent="1" alpha="1">
        <layer class="SimpleMarker" locked="0" enabled="1" pass="0">
          <prop k="angle" v="90"/>
          <prop k="color" v="239,19,0,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="semi_circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" type="marker" name="2" clip_to_extent="1" alpha="1">
        <layer class="SimpleMarker" locked="0" enabled="1" pass="0">
          <prop k="angle" v="0"/>
          <prop k="color" v="156,156,156,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MM"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="2"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MM"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="{272e2219-bca4-4cd7-b825-6351d76bf053}">
      <rule description="id" key="{eb1650f8-0ce9-4254-97a8-263a1e64b16f}" active="0">
        <settings calloutType="simple">
          <text-style previewBkgrdColor="255,255,255,255" multilineHeight="1" fontUnderline="0" textColor="0,0,0,255" fontItalic="0" fontKerning="1" fontWeight="75" fontStrikeout="0" fontCapitals="0" fontLetterSpacing="0" useSubstitutions="0" fieldName="id" fontFamily="MS Shell Dlg 2" fontSizeUnit="Point" blendMode="0" isExpression="0" namedStyle="Bold" textOrientation="horizontal" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontSize="9" fontWordSpacing="0" textOpacity="1">
            <text-buffer bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferJoinStyle="128" bufferBlendMode="0" bufferDraw="1" bufferNoFill="0" bufferSize="1" bufferSizeUnits="MM" bufferOpacity="1" bufferColor="255,255,255,255"/>
            <background shapeRotationType="0" shapeFillColor="255,255,255,255" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeType="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeSizeUnit="MM" shapeSizeX="0" shapeOffsetUnit="MM" shapeSizeType="0" shapeSizeY="0" shapeRotation="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetX="0" shapeOpacity="1" shapeBlendMode="0" shapeRadiiX="0" shapeDraw="0" shapeBorderColor="128,128,128,255" shapeBorderWidthUnit="MM" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSVGFile="" shapeOffsetY="0" shapeBorderWidth="0" shapeRadiiY="0" shapeRadiiUnit="MM"/>
            <shadow shadowRadiusUnit="MM" shadowRadiusAlphaOnly="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadius="1.5" shadowDraw="0" shadowScale="100" shadowOffsetUnit="MM" shadowBlendMode="6" shadowColor="0,0,0,255" shadowOpacity="0.7" shadowOffsetGlobal="1" shadowOffsetDist="1" shadowOffsetAngle="135" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowUnder="0"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format addDirectionSymbol="0" reverseDirectionSymbol="0" leftDirectionSymbol="&lt;" wrapChar="" multilineAlign="3" formatNumbers="0" plussign="0" rightDirectionSymbol=">" placeDirectionSymbol="0" autoWrapLength="0" decimals="3" useMaxLineLengthForAutoWrap="1"/>
          <placement labelOffsetMapUnitScale="3x:0,0,0,0,0,0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleOut="-25" distUnits="MM" fitInPolygonOnly="0" geometryGenerator="" geometryGeneratorType="PointGeometry" maxCurvedCharAngleIn="25" centroidWhole="0" placementFlags="10" repeatDistance="0" quadOffset="1" preserveRotation="1" yOffset="-1" dist="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" placement="1" distMapUnitScale="3x:0,0,0,0,0,0" centroidInside="0" overrunDistance="0" layerType="UnknownGeometry" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MapUnit" offsetType="0" rotationAngle="0" overrunDistanceUnit="MM" xOffset="0" geometryGeneratorEnabled="0" priority="5" repeatDistanceUnits="MM"/>
          <rendering fontMaxPixelSize="10000" displayAll="1" scaleMax="10000000" fontMinPixelSize="3" upsidedownLabels="0" scaleMin="1" labelPerPart="0" zIndex="0" obstacle="1" minFeatureSize="0" limitNumLabels="0" obstacleType="0" scaleVisibility="0" mergeLines="0" drawLabels="1" fontLimitPixelSize="0" obstacleFactor="1" maxNumLabels="2000"/>
          <dd_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option type="QString" name="anchorPoint" value="pole_of_inaccessibility"/>
              <Option type="Map" name="ddProperties">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
              <Option type="bool" name="drawToAllParts" value="false"/>
              <Option type="QString" name="enabled" value="0"/>
              <Option type="QString" name="lineSymbol" value="&lt;symbol force_rhr=&quot;0&quot; type=&quot;line&quot; name=&quot;symbol&quot; clip_to_extent=&quot;1&quot; alpha=&quot;1&quot;>&lt;layer class=&quot;SimpleLine&quot; locked=&quot;0&quot; enabled=&quot;1&quot; pass=&quot;0&quot;>&lt;prop k=&quot;capstyle&quot; v=&quot;square&quot;/>&lt;prop k=&quot;customdash&quot; v=&quot;5;2&quot;/>&lt;prop k=&quot;customdash_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;customdash_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;draw_inside_polygon&quot; v=&quot;0&quot;/>&lt;prop k=&quot;joinstyle&quot; v=&quot;bevel&quot;/>&lt;prop k=&quot;line_color&quot; v=&quot;60,60,60,255&quot;/>&lt;prop k=&quot;line_style&quot; v=&quot;solid&quot;/>&lt;prop k=&quot;line_width&quot; v=&quot;0.3&quot;/>&lt;prop k=&quot;line_width_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;offset&quot; v=&quot;0&quot;/>&lt;prop k=&quot;offset_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;offset_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;ring_filter&quot; v=&quot;0&quot;/>&lt;prop k=&quot;use_custom_dash&quot; v=&quot;0&quot;/>&lt;prop k=&quot;width_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; name=&quot;name&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;type&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>"/>
              <Option type="double" name="minLength" value="0"/>
              <Option type="QString" name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0"/>
              <Option type="QString" name="minLengthUnit" value="MM"/>
              <Option type="double" name="offsetFromAnchor" value="0"/>
              <Option type="QString" name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0"/>
              <Option type="QString" name="offsetFromAnchorUnit" value="MM"/>
              <Option type="double" name="offsetFromLabel" value="0"/>
              <Option type="QString" name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0"/>
              <Option type="QString" name="offsetFromLabelUnit" value="MM"/>
            </Option>
          </callout>
        </settings>
      </rule>
      <rule description="type" key="{7ba9374d-ab43-44fd-981f-a059e6bd4f64}">
        <settings calloutType="simple">
          <text-style previewBkgrdColor="255,255,255,255" multilineHeight="1" fontUnderline="0" textColor="255,129,0,255" fontItalic="0" fontKerning="1" fontWeight="50" fontStrikeout="0" fontCapitals="0" fontLetterSpacing="0" useSubstitutions="0" fieldName="type" fontFamily="MS Shell Dlg 2" fontSizeUnit="Point" blendMode="0" isExpression="0" namedStyle="Regular" textOrientation="horizontal" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontSize="11" fontWordSpacing="0" textOpacity="1">
            <text-buffer bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferJoinStyle="128" bufferBlendMode="0" bufferDraw="1" bufferNoFill="0" bufferSize="1.5" bufferSizeUnits="MM" bufferOpacity="1" bufferColor="255,255,255,255"/>
            <background shapeRotationType="0" shapeFillColor="255,255,255,255" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeType="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeSizeUnit="MM" shapeSizeX="0" shapeOffsetUnit="MM" shapeSizeType="0" shapeSizeY="0" shapeRotation="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetX="0" shapeOpacity="1" shapeBlendMode="0" shapeRadiiX="0" shapeDraw="0" shapeBorderColor="128,128,128,255" shapeBorderWidthUnit="MM" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSVGFile="" shapeOffsetY="0" shapeBorderWidth="0" shapeRadiiY="0" shapeRadiiUnit="MM">
              <symbol force_rhr="0" type="marker" name="markerSymbol" clip_to_extent="1" alpha="1">
                <layer class="SimpleMarker" locked="0" enabled="1" pass="0">
                  <prop k="angle" v="0"/>
                  <prop k="color" v="232,113,141,255"/>
                  <prop k="horizontal_anchor_point" v="1"/>
                  <prop k="joinstyle" v="bevel"/>
                  <prop k="name" v="circle"/>
                  <prop k="offset" v="0,0"/>
                  <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="offset_unit" v="MM"/>
                  <prop k="outline_color" v="35,35,35,255"/>
                  <prop k="outline_style" v="solid"/>
                  <prop k="outline_width" v="0"/>
                  <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="outline_width_unit" v="MM"/>
                  <prop k="scale_method" v="diameter"/>
                  <prop k="size" v="2"/>
                  <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
                  <prop k="size_unit" v="MM"/>
                  <prop k="vertical_anchor_point" v="1"/>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option type="QString" name="name" value=""/>
                      <Option name="properties"/>
                      <Option type="QString" name="type" value="collection"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowRadiusUnit="MM" shadowRadiusAlphaOnly="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadius="1.5" shadowDraw="0" shadowScale="100" shadowOffsetUnit="MM" shadowBlendMode="6" shadowColor="0,0,0,255" shadowOpacity="0.7" shadowOffsetGlobal="1" shadowOffsetDist="1" shadowOffsetAngle="135" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowUnder="0"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format addDirectionSymbol="0" reverseDirectionSymbol="0" leftDirectionSymbol="&lt;" wrapChar="" multilineAlign="3" formatNumbers="0" plussign="0" rightDirectionSymbol=">" placeDirectionSymbol="0" autoWrapLength="0" decimals="3" useMaxLineLengthForAutoWrap="1"/>
          <placement labelOffsetMapUnitScale="3x:0,0,0,0,0,0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleOut="-25" distUnits="MM" fitInPolygonOnly="0" geometryGenerator="" geometryGeneratorType="PointGeometry" maxCurvedCharAngleIn="25" centroidWhole="0" placementFlags="10" repeatDistance="0" quadOffset="2" preserveRotation="1" yOffset="1" dist="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" placement="1" distMapUnitScale="3x:0,0,0,0,0,0" centroidInside="0" overrunDistance="0" layerType="PointGeometry" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MapUnit" offsetType="0" rotationAngle="0" overrunDistanceUnit="MM" xOffset="0" geometryGeneratorEnabled="0" priority="5" repeatDistanceUnits="MM"/>
          <rendering fontMaxPixelSize="10000" displayAll="1" scaleMax="10000000" fontMinPixelSize="3" upsidedownLabels="0" scaleMin="1" labelPerPart="0" zIndex="0" obstacle="1" minFeatureSize="0" limitNumLabels="0" obstacleType="0" scaleVisibility="0" mergeLines="0" drawLabels="1" fontLimitPixelSize="0" obstacleFactor="1" maxNumLabels="2000"/>
          <dd_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option type="QString" name="anchorPoint" value="pole_of_inaccessibility"/>
              <Option type="Map" name="ddProperties">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
              <Option type="bool" name="drawToAllParts" value="false"/>
              <Option type="QString" name="enabled" value="0"/>
              <Option type="QString" name="lineSymbol" value="&lt;symbol force_rhr=&quot;0&quot; type=&quot;line&quot; name=&quot;symbol&quot; clip_to_extent=&quot;1&quot; alpha=&quot;1&quot;>&lt;layer class=&quot;SimpleLine&quot; locked=&quot;0&quot; enabled=&quot;1&quot; pass=&quot;0&quot;>&lt;prop k=&quot;capstyle&quot; v=&quot;square&quot;/>&lt;prop k=&quot;customdash&quot; v=&quot;5;2&quot;/>&lt;prop k=&quot;customdash_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;customdash_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;draw_inside_polygon&quot; v=&quot;0&quot;/>&lt;prop k=&quot;joinstyle&quot; v=&quot;bevel&quot;/>&lt;prop k=&quot;line_color&quot; v=&quot;60,60,60,255&quot;/>&lt;prop k=&quot;line_style&quot; v=&quot;solid&quot;/>&lt;prop k=&quot;line_width&quot; v=&quot;0.3&quot;/>&lt;prop k=&quot;line_width_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;offset&quot; v=&quot;0&quot;/>&lt;prop k=&quot;offset_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;prop k=&quot;offset_unit&quot; v=&quot;MM&quot;/>&lt;prop k=&quot;ring_filter&quot; v=&quot;0&quot;/>&lt;prop k=&quot;use_custom_dash&quot; v=&quot;0&quot;/>&lt;prop k=&quot;width_map_unit_scale&quot; v=&quot;3x:0,0,0,0,0,0&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; name=&quot;name&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;type&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>"/>
              <Option type="double" name="minLength" value="0"/>
              <Option type="QString" name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0"/>
              <Option type="QString" name="minLengthUnit" value="MM"/>
              <Option type="double" name="offsetFromAnchor" value="0"/>
              <Option type="QString" name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0"/>
              <Option type="QString" name="offsetFromAnchorUnit" value="MM"/>
              <Option type="double" name="offsetFromLabel" value="0"/>
              <Option type="QString" name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0"/>
              <Option type="QString" name="offsetFromLabelUnit" value="MM"/>
            </Option>
          </callout>
        </settings>
      </rule>
    </rules>
  </labeling>
  <customproperties>
    <property key="dualview/previewExpressions" value="COALESCE(&quot;id&quot;, '&lt;NULL>')"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="labeling/addDirectionSymbol" value="false"/>
    <property key="labeling/angleOffset" value="0"/>
    <property key="labeling/blendMode" value="0"/>
    <property key="labeling/bufferBlendMode" value="0"/>
    <property key="labeling/bufferColorA" value="255"/>
    <property key="labeling/bufferColorB" value="255"/>
    <property key="labeling/bufferColorG" value="255"/>
    <property key="labeling/bufferColorR" value="255"/>
    <property key="labeling/bufferDraw" value="true"/>
    <property key="labeling/bufferJoinStyle" value="64"/>
    <property key="labeling/bufferNoFill" value="false"/>
    <property key="labeling/bufferSize" value="1"/>
    <property key="labeling/bufferSizeInMapUnits" value="false"/>
    <property key="labeling/bufferSizeMapUnitMaxScale" value="0"/>
    <property key="labeling/bufferSizeMapUnitMinScale" value="0"/>
    <property key="labeling/bufferSizeMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/bufferTransp" value="0"/>
    <property key="labeling/centroidInside" value="false"/>
    <property key="labeling/centroidWhole" value="false"/>
    <property key="labeling/decimals" value="3"/>
    <property key="labeling/displayAll" value="false"/>
    <property key="labeling/dist" value="0"/>
    <property key="labeling/distInMapUnits" value="false"/>
    <property key="labeling/distMapUnitMaxScale" value="0"/>
    <property key="labeling/distMapUnitMinScale" value="0"/>
    <property key="labeling/distMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/drawLabels" value="true"/>
    <property key="labeling/enabled" value="true"/>
    <property key="labeling/fieldName" value="id"/>
    <property key="labeling/fitInPolygonOnly" value="false"/>
    <property key="labeling/fontCapitals" value="0"/>
    <property key="labeling/fontFamily" value="MS Shell Dlg 2"/>
    <property key="labeling/fontItalic" value="false"/>
    <property key="labeling/fontLetterSpacing" value="0"/>
    <property key="labeling/fontLimitPixelSize" value="false"/>
    <property key="labeling/fontMaxPixelSize" value="10000"/>
    <property key="labeling/fontMinPixelSize" value="3"/>
    <property key="labeling/fontSize" value="12"/>
    <property key="labeling/fontSizeInMapUnits" value="false"/>
    <property key="labeling/fontSizeMapUnitMaxScale" value="0"/>
    <property key="labeling/fontSizeMapUnitMinScale" value="0"/>
    <property key="labeling/fontSizeMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/fontStrikeout" value="false"/>
    <property key="labeling/fontUnderline" value="false"/>
    <property key="labeling/fontWeight" value="75"/>
    <property key="labeling/fontWordSpacing" value="0"/>
    <property key="labeling/formatNumbers" value="false"/>
    <property key="labeling/isExpression" value="false"/>
    <property key="labeling/labelOffsetInMapUnits" value="true"/>
    <property key="labeling/labelOffsetMapUnitMaxScale" value="0"/>
    <property key="labeling/labelOffsetMapUnitMinScale" value="0"/>
    <property key="labeling/labelOffsetMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/labelPerPart" value="false"/>
    <property key="labeling/leftDirectionSymbol" value="&lt;"/>
    <property key="labeling/limitNumLabels" value="false"/>
    <property key="labeling/maxCurvedCharAngleIn" value="20"/>
    <property key="labeling/maxCurvedCharAngleOut" value="-20"/>
    <property key="labeling/maxNumLabels" value="2000"/>
    <property key="labeling/mergeLines" value="false"/>
    <property key="labeling/minFeatureSize" value="0"/>
    <property key="labeling/multilineAlign" value="0"/>
    <property key="labeling/multilineHeight" value="1"/>
    <property key="labeling/namedStyle" value="Bold"/>
    <property key="labeling/obstacle" value="true"/>
    <property key="labeling/obstacleFactor" value="1"/>
    <property key="labeling/obstacleType" value="0"/>
    <property key="labeling/offsetType" value="0"/>
    <property key="labeling/placeDirectionSymbol" value="0"/>
    <property key="labeling/placement" value="0"/>
    <property key="labeling/placementFlags" value="10"/>
    <property key="labeling/plussign" value="false"/>
    <property key="labeling/predefinedPositionOrder" value="TR,TL,BR,BL,R,L,TSR,BSR"/>
    <property key="labeling/preserveRotation" value="true"/>
    <property key="labeling/previewBkgrdColor" value="#ffffff"/>
    <property key="labeling/priority" value="5"/>
    <property key="labeling/quadOffset" value="4"/>
    <property key="labeling/repeatDistance" value="0"/>
    <property key="labeling/repeatDistanceMapUnitMaxScale" value="0"/>
    <property key="labeling/repeatDistanceMapUnitMinScale" value="0"/>
    <property key="labeling/repeatDistanceMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/repeatDistanceUnit" value="1"/>
    <property key="labeling/reverseDirectionSymbol" value="false"/>
    <property key="labeling/rightDirectionSymbol" value=">"/>
    <property key="labeling/scaleMax" value="10000000"/>
    <property key="labeling/scaleMin" value="1"/>
    <property key="labeling/scaleVisibility" value="false"/>
    <property key="labeling/shadowBlendMode" value="6"/>
    <property key="labeling/shadowColorB" value="0"/>
    <property key="labeling/shadowColorG" value="0"/>
    <property key="labeling/shadowColorR" value="0"/>
    <property key="labeling/shadowDraw" value="false"/>
    <property key="labeling/shadowOffsetAngle" value="135"/>
    <property key="labeling/shadowOffsetDist" value="1"/>
    <property key="labeling/shadowOffsetGlobal" value="true"/>
    <property key="labeling/shadowOffsetMapUnitMaxScale" value="0"/>
    <property key="labeling/shadowOffsetMapUnitMinScale" value="0"/>
    <property key="labeling/shadowOffsetMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/shadowOffsetUnits" value="1"/>
    <property key="labeling/shadowRadius" value="1.5"/>
    <property key="labeling/shadowRadiusAlphaOnly" value="false"/>
    <property key="labeling/shadowRadiusMapUnitMaxScale" value="0"/>
    <property key="labeling/shadowRadiusMapUnitMinScale" value="0"/>
    <property key="labeling/shadowRadiusMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/shadowRadiusUnits" value="1"/>
    <property key="labeling/shadowScale" value="100"/>
    <property key="labeling/shadowTransparency" value="30"/>
    <property key="labeling/shadowUnder" value="0"/>
    <property key="labeling/shapeBlendMode" value="0"/>
    <property key="labeling/shapeBorderColorA" value="255"/>
    <property key="labeling/shapeBorderColorB" value="128"/>
    <property key="labeling/shapeBorderColorG" value="128"/>
    <property key="labeling/shapeBorderColorR" value="128"/>
    <property key="labeling/shapeBorderWidth" value="0"/>
    <property key="labeling/shapeBorderWidthMapUnitMaxScale" value="0"/>
    <property key="labeling/shapeBorderWidthMapUnitMinScale" value="0"/>
    <property key="labeling/shapeBorderWidthMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/shapeBorderWidthUnits" value="1"/>
    <property key="labeling/shapeDraw" value="false"/>
    <property key="labeling/shapeFillColorA" value="255"/>
    <property key="labeling/shapeFillColorB" value="255"/>
    <property key="labeling/shapeFillColorG" value="255"/>
    <property key="labeling/shapeFillColorR" value="255"/>
    <property key="labeling/shapeJoinStyle" value="64"/>
    <property key="labeling/shapeOffsetMapUnitMaxScale" value="0"/>
    <property key="labeling/shapeOffsetMapUnitMinScale" value="0"/>
    <property key="labeling/shapeOffsetMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/shapeOffsetUnits" value="1"/>
    <property key="labeling/shapeOffsetX" value="0"/>
    <property key="labeling/shapeOffsetY" value="0"/>
    <property key="labeling/shapeRadiiMapUnitMaxScale" value="0"/>
    <property key="labeling/shapeRadiiMapUnitMinScale" value="0"/>
    <property key="labeling/shapeRadiiMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/shapeRadiiUnits" value="1"/>
    <property key="labeling/shapeRadiiX" value="0"/>
    <property key="labeling/shapeRadiiY" value="0"/>
    <property key="labeling/shapeRotation" value="0"/>
    <property key="labeling/shapeRotationType" value="0"/>
    <property key="labeling/shapeSVGFile" value=""/>
    <property key="labeling/shapeSizeMapUnitMaxScale" value="0"/>
    <property key="labeling/shapeSizeMapUnitMinScale" value="0"/>
    <property key="labeling/shapeSizeMapUnitScale" value="0,0,0,0,0,0"/>
    <property key="labeling/shapeSizeType" value="0"/>
    <property key="labeling/shapeSizeUnits" value="1"/>
    <property key="labeling/shapeSizeX" value="0"/>
    <property key="labeling/shapeSizeY" value="0"/>
    <property key="labeling/shapeTransparency" value="0"/>
    <property key="labeling/shapeType" value="0"/>
    <property key="labeling/substitutions" value="&lt;substitutions/>"/>
    <property key="labeling/textColorA" value="255"/>
    <property key="labeling/textColorB" value="0"/>
    <property key="labeling/textColorG" value="0"/>
    <property key="labeling/textColorR" value="0"/>
    <property key="labeling/textTransp" value="0"/>
    <property key="labeling/upsidedownLabels" value="0"/>
    <property key="labeling/useSubstitutions" value="false"/>
    <property key="labeling/wrapChar" value=""/>
    <property key="labeling/xOffset" value="0"/>
    <property key="labeling/yOffset" value="0"/>
    <property key="labeling/zIndex" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Pie" attributeLegend="1">
    <DiagramCategory maxScaleDenominator="1e+08" diagramOrientation="Up" sizeType="MM" penAlpha="255" sizeScale="3x:0,0,0,0,0,0" scaleBasedVisibility="0" lineSizeScale="3x:0,0,0,0,0,0" backgroundColor="#ffffff" backgroundAlpha="255" minimumSize="0" minScaleDenominator="0" penWidth="0" width="15" labelPlacementMethod="XHeight" opacity="1" scaleDependency="Area" penColor="#000000" lineSizeType="MM" enabled="0" rotationOffset="0" barWidth="5" height="15">
      <fontProperties description="MS Shell Dlg 2,7.5,-1,5,50,0,0,0,0,0" style=""/>
      <attribute label="" field="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings linePlacementFlags="2" obstacle="0" priority="0" zIndex="0" showAll="1" placement="0" dist="0">
    <properties>
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option type="Map" name="properties">
          <Option type="Map" name="positionX">
            <Option type="bool" name="active" value="true"/>
            <Option type="QString" name="field" value="decor"/>
            <Option type="int" name="type" value="2"/>
          </Option>
          <Option type="Map" name="positionY">
            <Option type="bool" name="active" value="true"/>
            <Option type="QString" name="field" value="decor"/>
            <Option type="int" name="type" value="2"/>
          </Option>
          <Option type="Map" name="show">
            <Option type="bool" name="active" value="true"/>
            <Option type="QString" name="field" value="decor"/>
            <Option type="int" name="type" value="2"/>
          </Option>
        </Option>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="decor">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="id">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="type">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="type"/>
            <Option type="QString" name="Layer" value="typo_ug20170618110741000"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="type"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="auto">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sym_h">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nb_lign">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nb_col">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="incomplet">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" name="CheckedState" value="1"/>
            <Option type="QString" name="UncheckedState" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="info_mq">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" name="CheckedState" value="1"/>
            <Option type="QString" name="UncheckedState" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="continu">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" name="CheckedState" value="1"/>
            <Option type="QString" name="UncheckedState" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sens">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="famille">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="QString" name="AllowMulti" value="0"/>
            <Option type="QString" name="AllowNull" value="0"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="famille"/>
            <Option type="QString" name="Layer" value="famille20200416222028031"/>
            <Option type="QString" name="OrderByValue" value="0"/>
            <Option type="QString" name="UseCompleter" value="0"/>
            <Option type="QString" name="Value" value="famille"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="prof">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="notes">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="regist">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="x">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="y">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="site">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="structure">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="pas_geom">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="gravure">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="peinture">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="technologie">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="QString" name="AllowMulti" value="0"/>
            <Option type="QString" name="AllowNull" value="0"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="type"/>
            <Option type="QString" name="Layer" value="techno_ug20170902221328512"/>
            <Option type="QString" name="OrderByValue" value="0"/>
            <Option type="QString" name="UseCompleter" value="0"/>
            <Option type="QString" name="Value" value="type"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="a_fa">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="chr_1">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="false"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="chr_1"/>
            <Option type="QString" name="Layer" value="chrono20170919110606789"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="false"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="chr_1"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="chr_2">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="chr_3">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="chr_4">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="chr_5">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="chr_6">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="chr_7">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geom_obj">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="tpq_cul">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="QString" name="AllowMulti" value="0"/>
            <Option type="QString" name="AllowNull" value="0"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="chr_1"/>
            <Option type="QString" name="Layer" value="chrono20170919110606789"/>
            <Option type="QString" name="OrderByValue" value="0"/>
            <Option type="QString" name="UseCompleter" value="0"/>
            <Option type="QString" name="Value" value="chr_1"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="taq_cul">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="QString" name="AllowMulti" value="0"/>
            <Option type="QString" name="AllowNull" value="0"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="chr_1"/>
            <Option type="QString" name="Layer" value="chrono20170919110606789"/>
            <Option type="QString" name="OrderByValue" value="0"/>
            <Option type="QString" name="UseCompleter" value="0"/>
            <Option type="QString" name="Value" value="chr_1"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="tp_taq_dat">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" name="CheckedState" value="1"/>
            <Option type="QString" name="UncheckedState" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="tpq">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="taq">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="selection">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" name="CheckedState" value="1"/>
            <Option type="QString" name="UncheckedState" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geom_shape">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="aire">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="simplify">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geom_contour">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geom_mbc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bib">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fonction">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="QString" name="AllowMulti" value="0"/>
            <Option type="QString" name="AllowNull" value="0"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="fonction"/>
            <Option type="QString" name="Layer" value="fonctions20200416222339494"/>
            <Option type="QString" name="OrderByValue" value="0"/>
            <Option type="QString" name="UseCompleter" value="0"/>
            <Option type="QString" name="Value" value="fonction"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="type_eng">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="long">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="larg">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="dim_notes">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="dim_is_abs">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="long_cm">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="larg_cm">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="gr_dim">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idf">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="aspect_techno">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="id_txt">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" name="" field="decor"/>
    <alias index="1" name="" field="id"/>
    <alias index="2" name="" field="type"/>
    <alias index="3" name="" field="auto"/>
    <alias index="4" name="" field="sym_h"/>
    <alias index="5" name="" field="nb_lign"/>
    <alias index="6" name="" field="nb_col"/>
    <alias index="7" name="" field="incomplet"/>
    <alias index="8" name="" field="info_mq"/>
    <alias index="9" name="" field="continu"/>
    <alias index="10" name="" field="sens"/>
    <alias index="11" name="" field="famille"/>
    <alias index="12" name="" field="prof"/>
    <alias index="13" name="" field="notes"/>
    <alias index="14" name="" field="regist"/>
    <alias index="15" name="" field="x"/>
    <alias index="16" name="" field="y"/>
    <alias index="17" name="" field="site"/>
    <alias index="18" name="" field="structure"/>
    <alias index="19" name="" field="pas_geom"/>
    <alias index="20" name="" field="gravure"/>
    <alias index="21" name="" field="peinture"/>
    <alias index="22" name="" field="technologie"/>
    <alias index="23" name="" field="a_fa"/>
    <alias index="24" name="" field="chr_1"/>
    <alias index="25" name="" field="chr_2"/>
    <alias index="26" name="" field="chr_3"/>
    <alias index="27" name="" field="chr_4"/>
    <alias index="28" name="" field="chr_5"/>
    <alias index="29" name="" field="chr_6"/>
    <alias index="30" name="" field="chr_7"/>
    <alias index="31" name="" field="geom_obj"/>
    <alias index="32" name="" field="tpq_cul"/>
    <alias index="33" name="" field="taq_cul"/>
    <alias index="34" name="" field="tp_taq_dat"/>
    <alias index="35" name="" field="tpq"/>
    <alias index="36" name="" field="taq"/>
    <alias index="37" name="" field="selection"/>
    <alias index="38" name="" field="geom_shape"/>
    <alias index="39" name="" field="aire"/>
    <alias index="40" name="" field="simplify"/>
    <alias index="41" name="" field="geom_contour"/>
    <alias index="42" name="" field="geom_mbc"/>
    <alias index="43" name="" field="bib"/>
    <alias index="44" name="" field="fonction"/>
    <alias index="45" name="" field="type_eng"/>
    <alias index="46" name="" field="long"/>
    <alias index="47" name="" field="larg"/>
    <alias index="48" name="" field="dim_notes"/>
    <alias index="49" name="" field="dim_is_abs"/>
    <alias index="50" name="" field="long_cm"/>
    <alias index="51" name="" field="larg_cm"/>
    <alias index="52" name="" field="gr_dim"/>
    <alias index="53" name="" field="idf"/>
    <alias index="54" name="" field="aspect_techno"/>
    <alias index="55" name="" field="id_txt"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="regexp_replace( @project_filename,'.qgs','')" field="decor" applyOnUpdate="0"/>
    <default expression="maximum(&quot;id&quot;)+1" field="id" applyOnUpdate="0"/>
    <default expression="'xxx'" field="type" applyOnUpdate="0"/>
    <default expression="" field="auto" applyOnUpdate="0"/>
    <default expression="" field="sym_h" applyOnUpdate="0"/>
    <default expression="" field="nb_lign" applyOnUpdate="0"/>
    <default expression="" field="nb_col" applyOnUpdate="0"/>
    <default expression="" field="incomplet" applyOnUpdate="0"/>
    <default expression="" field="info_mq" applyOnUpdate="0"/>
    <default expression="" field="continu" applyOnUpdate="0"/>
    <default expression="" field="sens" applyOnUpdate="0"/>
    <default expression="" field="famille" applyOnUpdate="0"/>
    <default expression="" field="prof" applyOnUpdate="0"/>
    <default expression="" field="notes" applyOnUpdate="0"/>
    <default expression="" field="regist" applyOnUpdate="0"/>
    <default expression="" field="x" applyOnUpdate="0"/>
    <default expression="" field="y" applyOnUpdate="0"/>
    <default expression="substr(@project_folder,13,999)" field="site" applyOnUpdate="0"/>
    <default expression="xxx" field="structure" applyOnUpdate="0"/>
    <default expression="" field="pas_geom" applyOnUpdate="0"/>
    <default expression="" field="gravure" applyOnUpdate="0"/>
    <default expression="" field="peinture" applyOnUpdate="0"/>
    <default expression="" field="technologie" applyOnUpdate="0"/>
    <default expression="" field="a_fa" applyOnUpdate="0"/>
    <default expression="'xxx'" field="chr_1" applyOnUpdate="0"/>
    <default expression="'xxx'" field="chr_2" applyOnUpdate="0"/>
    <default expression="'xxx'" field="chr_3" applyOnUpdate="0"/>
    <default expression="'xxx'" field="chr_4" applyOnUpdate="0"/>
    <default expression="'xxx'" field="chr_5" applyOnUpdate="0"/>
    <default expression="'xxx'" field="chr_6" applyOnUpdate="0"/>
    <default expression="'xxx'" field="chr_7" applyOnUpdate="0"/>
    <default expression="" field="geom_obj" applyOnUpdate="0"/>
    <default expression="'xxx'" field="tpq_cul" applyOnUpdate="0"/>
    <default expression="'xxx'" field="taq_cul" applyOnUpdate="0"/>
    <default expression="0" field="tp_taq_dat" applyOnUpdate="0"/>
    <default expression="" field="tpq" applyOnUpdate="0"/>
    <default expression="" field="taq" applyOnUpdate="0"/>
    <default expression="" field="selection" applyOnUpdate="0"/>
    <default expression="" field="geom_shape" applyOnUpdate="0"/>
    <default expression="" field="aire" applyOnUpdate="0"/>
    <default expression="" field="simplify" applyOnUpdate="0"/>
    <default expression="" field="geom_contour" applyOnUpdate="0"/>
    <default expression="" field="geom_mbc" applyOnUpdate="0"/>
    <default expression="" field="bib" applyOnUpdate="0"/>
    <default expression="" field="fonction" applyOnUpdate="0"/>
    <default expression="" field="type_eng" applyOnUpdate="0"/>
    <default expression="" field="long" applyOnUpdate="0"/>
    <default expression="" field="larg" applyOnUpdate="0"/>
    <default expression="" field="dim_notes" applyOnUpdate="0"/>
    <default expression="" field="dim_is_abs" applyOnUpdate="0"/>
    <default expression="" field="long_cm" applyOnUpdate="0"/>
    <default expression="" field="larg_cm" applyOnUpdate="0"/>
    <default expression="" field="gr_dim" applyOnUpdate="0"/>
    <default expression="" field="idf" applyOnUpdate="0"/>
    <default expression="" field="aspect_techno" applyOnUpdate="0"/>
    <default expression="" field="id_txt" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="1" field="decor" constraints="1"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="1" field="id" constraints="1"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="type" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="auto" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="sym_h" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="nb_lign" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="nb_col" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="incomplet" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="info_mq" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="continu" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="sens" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="famille" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="prof" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="notes" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="regist" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="x" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="y" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="1" field="site" constraints="1"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="1" field="structure" constraints="1"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="pas_geom" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="gravure" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="peinture" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="technologie" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="a_fa" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="chr_1" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="chr_2" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="chr_3" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="chr_4" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="chr_5" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="chr_6" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="chr_7" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="geom_obj" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="tpq_cul" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="taq_cul" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="tp_taq_dat" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="tpq" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="taq" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="selection" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="geom_shape" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="aire" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="simplify" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="geom_contour" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="geom_mbc" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="bib" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="fonction" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="type_eng" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="long" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="larg" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="dim_notes" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="dim_is_abs" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="long_cm" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="larg_cm" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="gr_dim" constraints="0"/>
    <constraint exp_strength="0" unique_strength="1" notnull_strength="1" field="idf" constraints="3"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="aspect_techno" constraints="0"/>
    <constraint exp_strength="0" unique_strength="0" notnull_strength="0" field="id_txt" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="decor"/>
    <constraint exp="" desc="" field="id"/>
    <constraint exp="" desc="" field="type"/>
    <constraint exp="" desc="" field="auto"/>
    <constraint exp="" desc="" field="sym_h"/>
    <constraint exp="" desc="" field="nb_lign"/>
    <constraint exp="" desc="" field="nb_col"/>
    <constraint exp="" desc="" field="incomplet"/>
    <constraint exp="" desc="" field="info_mq"/>
    <constraint exp="" desc="" field="continu"/>
    <constraint exp="" desc="" field="sens"/>
    <constraint exp="" desc="" field="famille"/>
    <constraint exp="" desc="" field="prof"/>
    <constraint exp="" desc="" field="notes"/>
    <constraint exp="" desc="" field="regist"/>
    <constraint exp="" desc="" field="x"/>
    <constraint exp="" desc="" field="y"/>
    <constraint exp="" desc="" field="site"/>
    <constraint exp="" desc="" field="structure"/>
    <constraint exp="" desc="" field="pas_geom"/>
    <constraint exp="" desc="" field="gravure"/>
    <constraint exp="" desc="" field="peinture"/>
    <constraint exp="" desc="" field="technologie"/>
    <constraint exp="" desc="" field="a_fa"/>
    <constraint exp="" desc="" field="chr_1"/>
    <constraint exp="" desc="" field="chr_2"/>
    <constraint exp="" desc="" field="chr_3"/>
    <constraint exp="" desc="" field="chr_4"/>
    <constraint exp="" desc="" field="chr_5"/>
    <constraint exp="" desc="" field="chr_6"/>
    <constraint exp="" desc="" field="chr_7"/>
    <constraint exp="" desc="" field="geom_obj"/>
    <constraint exp="" desc="" field="tpq_cul"/>
    <constraint exp="" desc="" field="taq_cul"/>
    <constraint exp="" desc="" field="tp_taq_dat"/>
    <constraint exp="" desc="" field="tpq"/>
    <constraint exp="" desc="" field="taq"/>
    <constraint exp="" desc="" field="selection"/>
    <constraint exp="" desc="" field="geom_shape"/>
    <constraint exp="" desc="" field="aire"/>
    <constraint exp="" desc="" field="simplify"/>
    <constraint exp="" desc="" field="geom_contour"/>
    <constraint exp="" desc="" field="geom_mbc"/>
    <constraint exp="" desc="" field="bib"/>
    <constraint exp="" desc="" field="fonction"/>
    <constraint exp="" desc="" field="type_eng"/>
    <constraint exp="" desc="" field="long"/>
    <constraint exp="" desc="" field="larg"/>
    <constraint exp="" desc="" field="dim_notes"/>
    <constraint exp="" desc="" field="dim_is_abs"/>
    <constraint exp="" desc="" field="long_cm"/>
    <constraint exp="" desc="" field="larg_cm"/>
    <constraint exp="" desc="" field="gr_dim"/>
    <constraint exp="" desc="" field="idf"/>
    <constraint exp="" desc="" field="aspect_techno"/>
    <constraint exp="" desc="" field="id_txt"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{efeb5430-a99f-4367-94ac-21880d7c1ada}"/>
    <actionsetting id="{2f16eb3a-97d5-4f8f-985c-dd2c0a0c8d31}" type="0" name="" capture="0" action="" isEnabledOnlyWhenEditable="0" shortTitle="" icon="" notificationMessage="">
      <actionScope id="Canvas"/>
      <actionScope id="Field"/>
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting id="{5c9ee003-4333-4955-a763-0bc2f1a3a0d5}" type="5" name="Ouvre le dossier de l'objet" capture="0" action="[% @project_folder %]" isEnabledOnlyWhenEditable="0" shortTitle="" icon="" notificationMessage="">
      <actionScope id="Canvas"/>
      <actionScope id="Field"/>
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting id="{60c89f03-f42c-4350-8ba1-e314b5dc32b5}" type="5" name="Ouvre la liste des connexions" capture="0" action="[%concat(@project_folder,'/',@layer_name,'.csv' )%]" isEnabledOnlyWhenEditable="0" shortTitle="" icon="" notificationMessage="">
      <actionScope id="Canvas"/>
      <actionScope id="Field"/>
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="1" sortExpression="&quot;ID&quot;">
    <columns>
      <column type="actions" width="-1" hidden="1"/>
      <column type="field" name="decor" width="-1" hidden="0"/>
      <column type="field" name="id" width="-1" hidden="0"/>
      <column type="field" name="type" width="-1" hidden="0"/>
      <column type="field" name="sens" width="-1" hidden="0"/>
      <column type="field" name="long" width="-1" hidden="0"/>
      <column type="field" name="larg" width="-1" hidden="0"/>
      <column type="field" name="long_cm" width="-1" hidden="0"/>
      <column type="field" name="larg_cm" width="-1" hidden="0"/>
      <column type="field" name="gr_dim" width="-1" hidden="0"/>
      <column type="field" name="chr_1" width="-1" hidden="0"/>
      <column type="field" name="tpq_cul" width="-1" hidden="0"/>
      <column type="field" name="taq_cul" width="-1" hidden="0"/>
      <column type="field" name="tpq" width="-1" hidden="0"/>
      <column type="field" name="taq" width="-1" hidden="0"/>
      <column type="field" name="tp_taq_dat" width="-1" hidden="0"/>
      <column type="field" name="technologie" width="-1" hidden="0"/>
      <column type="field" name="incomplet" width="-1" hidden="0"/>
      <column type="field" name="auto" width="-1" hidden="0"/>
      <column type="field" name="sym_h" width="-1" hidden="0"/>
      <column type="field" name="nb_lign" width="-1" hidden="0"/>
      <column type="field" name="nb_col" width="-1" hidden="0"/>
      <column type="field" name="site" width="-1" hidden="0"/>
      <column type="field" name="structure" width="-1" hidden="0"/>
      <column type="field" name="bib" width="-1" hidden="0"/>
      <column type="field" name="info_mq" width="-1" hidden="0"/>
      <column type="field" name="continu" width="-1" hidden="0"/>
      <column type="field" name="famille" width="-1" hidden="0"/>
      <column type="field" name="prof" width="-1" hidden="0"/>
      <column type="field" name="notes" width="-1" hidden="0"/>
      <column type="field" name="regist" width="-1" hidden="0"/>
      <column type="field" name="x" width="-1" hidden="0"/>
      <column type="field" name="y" width="-1" hidden="0"/>
      <column type="field" name="idf" width="-1" hidden="0"/>
      <column type="field" name="pas_geom" width="-1" hidden="0"/>
      <column type="field" name="gravure" width="-1" hidden="0"/>
      <column type="field" name="peinture" width="-1" hidden="0"/>
      <column type="field" name="a_fa" width="-1" hidden="0"/>
      <column type="field" name="chr_2" width="-1" hidden="0"/>
      <column type="field" name="chr_3" width="-1" hidden="0"/>
      <column type="field" name="chr_4" width="-1" hidden="0"/>
      <column type="field" name="chr_5" width="-1" hidden="0"/>
      <column type="field" name="chr_6" width="-1" hidden="0"/>
      <column type="field" name="chr_7" width="-1" hidden="0"/>
      <column type="field" name="geom_obj" width="-1" hidden="0"/>
      <column type="field" name="selection" width="-1" hidden="0"/>
      <column type="field" name="geom_shape" width="-1" hidden="0"/>
      <column type="field" name="aire" width="-1" hidden="0"/>
      <column type="field" name="simplify" width="-1" hidden="0"/>
      <column type="field" name="geom_contour" width="-1" hidden="0"/>
      <column type="field" name="geom_mbc" width="-1" hidden="0"/>
      <column type="field" name="fonction" width="-1" hidden="0"/>
      <column type="field" name="type_eng" width="-1" hidden="0"/>
      <column type="field" name="dim_notes" width="-1" hidden="0"/>
      <column type="field" name="dim_is_abs" width="-1" hidden="0"/>
      <column type="field" name="aspect_techno" width="-1" hidden="0"/>
      <column type="field" name="id_txt" width="-1" hidden="0"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1">D:/Sites_10/Moulin (Le)/t_93</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>D:/Sites_10/Moulin (Le)/t_93</editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorContainer columnCount="1" groupBox="0" name="unite" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0">
      <attributeEditorField index="1" name="id" showLabel="1"/>
      <attributeEditorField index="2" name="type" showLabel="1"/>
      <attributeEditorField index="10" name="sens" showLabel="1"/>
      <attributeEditorContainer columnCount="1" groupBox="1" name="dimensions" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0">
        <attributeEditorContainer columnCount="1" groupBox="1" name="pix and cm" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0">
          <attributeEditorContainer columnCount="2" groupBox="1" name="px" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0">
            <attributeEditorField index="46" name="long" showLabel="1"/>
            <attributeEditorField index="47" name="larg" showLabel="1"/>
          </attributeEditorContainer>
          <attributeEditorContainer columnCount="2" groupBox="1" name="cm" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0">
            <attributeEditorField index="50" name="long_cm" showLabel="1"/>
            <attributeEditorField index="51" name="larg_cm" showLabel="1"/>
          </attributeEditorContainer>
          <attributeEditorField index="52" name="gr_dim" showLabel="1"/>
        </attributeEditorContainer>
        <attributeEditorContainer columnCount="2" groupBox="1" name="notes" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0">
          <attributeEditorField index="49" name="dim_is_abs" showLabel="1"/>
          <attributeEditorField index="48" name="dim_notes" showLabel="1"/>
        </attributeEditorContainer>
      </attributeEditorContainer>
      <attributeEditorContainer columnCount="3" groupBox="1" name="infos" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0">
        <attributeEditorField index="22" name="technologie" showLabel="1"/>
        <attributeEditorField index="4" name="sym_h" showLabel="1"/>
        <attributeEditorField index="7" name="incomplet" showLabel="1"/>
        <attributeEditorField index="8" name="info_mq" showLabel="1"/>
        <attributeEditorField index="9" name="continu" showLabel="1"/>
        <attributeEditorField index="19" name="pas_geom" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer columnCount="3" groupBox="1" name="contexte" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0">
        <attributeEditorField index="17" name="site" showLabel="1"/>
        <attributeEditorField index="18" name="structure" showLabel="1"/>
        <attributeEditorField index="0" name="decor" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorField index="13" name="notes" showLabel="1"/>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="1" groupBox="0" name="matrice" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0">
      <attributeEditorField index="3" name="auto" showLabel="1"/>
      <attributeEditorField index="5" name="nb_lign" showLabel="1"/>
      <attributeEditorField index="6" name="nb_col" showLabel="1"/>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="1" groupBox="0" name="chronologie" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0">
      <attributeEditorField index="24" name="chr_1" showLabel="1"/>
      <attributeEditorField index="25" name="chr_2" showLabel="1"/>
      <attributeEditorField index="26" name="chr_3" showLabel="1"/>
      <attributeEditorField index="27" name="chr_4" showLabel="1"/>
      <attributeEditorField index="28" name="chr_5" showLabel="1"/>
      <attributeEditorField index="29" name="chr_6" showLabel="1"/>
      <attributeEditorField index="30" name="chr_7" showLabel="1"/>
      <attributeEditorField index="32" name="tpq_cul" showLabel="1"/>
      <attributeEditorField index="33" name="taq_cul" showLabel="1"/>
      <attributeEditorField index="35" name="tpq" showLabel="1"/>
      <attributeEditorField index="36" name="taq" showLabel="1"/>
      <attributeEditorField index="34" name="tp_taq_dat" showLabel="1"/>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="1" groupBox="0" name="calcul" showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0">
      <attributeEditorField index="11" name="famille" showLabel="1"/>
      <attributeEditorField index="12" name="prof" showLabel="1"/>
      <attributeEditorField index="14" name="regist" showLabel="1"/>
      <attributeEditorField index="-1" name="epaule_milieu" showLabel="1"/>
      <attributeEditorField index="-1" name="carene_milieu" showLabel="1"/>
      <attributeEditorField index="-1" name="epaule_haut" showLabel="1"/>
      <attributeEditorField index="-1" name="carene_haut" showLabel="1"/>
      <attributeEditorField index="-1" name="epaule_bas" showLabel="1"/>
      <attributeEditorField index="-1" name="carene_bas" showLabel="1"/>
      <attributeEditorField index="15" name="x" showLabel="1"/>
      <attributeEditorField index="16" name="y" showLabel="1"/>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field editable="1" name="a_fa"/>
    <field editable="1" name="aire"/>
    <field editable="1" name="aspect_techno"/>
    <field editable="1" name="auto"/>
    <field editable="1" name="bib"/>
    <field editable="1" name="chr_1"/>
    <field editable="1" name="chr_2"/>
    <field editable="1" name="chr_3"/>
    <field editable="1" name="chr_4"/>
    <field editable="1" name="chr_5"/>
    <field editable="1" name="chr_6"/>
    <field editable="1" name="chr_7"/>
    <field editable="1" name="continu"/>
    <field editable="1" name="decor"/>
    <field editable="1" name="dim_is_abs"/>
    <field editable="1" name="dim_notes"/>
    <field editable="1" name="famille"/>
    <field editable="1" name="fonction"/>
    <field editable="1" name="geom_contour"/>
    <field editable="1" name="geom_mbc"/>
    <field editable="1" name="geom_obj"/>
    <field editable="1" name="geom_shape"/>
    <field editable="1" name="gr_dim"/>
    <field editable="1" name="gravure"/>
    <field editable="1" name="id"/>
    <field editable="1" name="id_txt"/>
    <field editable="1" name="idf"/>
    <field editable="1" name="incomplet"/>
    <field editable="1" name="info_mq"/>
    <field editable="1" name="larg"/>
    <field editable="1" name="larg_cm"/>
    <field editable="1" name="long"/>
    <field editable="1" name="long_cm"/>
    <field editable="1" name="nb_col"/>
    <field editable="1" name="nb_lign"/>
    <field editable="1" name="notes"/>
    <field editable="1" name="pas_geom"/>
    <field editable="1" name="peinture"/>
    <field editable="1" name="prof"/>
    <field editable="1" name="regist"/>
    <field editable="1" name="selection"/>
    <field editable="1" name="sens"/>
    <field editable="1" name="simplify"/>
    <field editable="1" name="site"/>
    <field editable="1" name="structure"/>
    <field editable="1" name="sym_h"/>
    <field editable="1" name="taq"/>
    <field editable="1" name="taq_cul"/>
    <field editable="1" name="technologie"/>
    <field editable="1" name="tp_taq_dat"/>
    <field editable="1" name="tpq"/>
    <field editable="1" name="tpq_cul"/>
    <field editable="1" name="type"/>
    <field editable="1" name="type_eng"/>
    <field editable="1" name="x"/>
    <field editable="1" name="y"/>
  </editable>
  <labelOnTop>
    <field name="a_fa" labelOnTop="0"/>
    <field name="aire" labelOnTop="0"/>
    <field name="aspect_techno" labelOnTop="0"/>
    <field name="auto" labelOnTop="0"/>
    <field name="bib" labelOnTop="0"/>
    <field name="chr_1" labelOnTop="0"/>
    <field name="chr_2" labelOnTop="0"/>
    <field name="chr_3" labelOnTop="0"/>
    <field name="chr_4" labelOnTop="0"/>
    <field name="chr_5" labelOnTop="0"/>
    <field name="chr_6" labelOnTop="0"/>
    <field name="chr_7" labelOnTop="0"/>
    <field name="continu" labelOnTop="0"/>
    <field name="decor" labelOnTop="0"/>
    <field name="dim_is_abs" labelOnTop="0"/>
    <field name="dim_notes" labelOnTop="0"/>
    <field name="famille" labelOnTop="0"/>
    <field name="fonction" labelOnTop="0"/>
    <field name="geom_contour" labelOnTop="0"/>
    <field name="geom_mbc" labelOnTop="0"/>
    <field name="geom_obj" labelOnTop="0"/>
    <field name="geom_shape" labelOnTop="0"/>
    <field name="gr_dim" labelOnTop="0"/>
    <field name="gravure" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="id_txt" labelOnTop="0"/>
    <field name="idf" labelOnTop="0"/>
    <field name="incomplet" labelOnTop="0"/>
    <field name="info_mq" labelOnTop="0"/>
    <field name="larg" labelOnTop="0"/>
    <field name="larg_cm" labelOnTop="0"/>
    <field name="long" labelOnTop="0"/>
    <field name="long_cm" labelOnTop="0"/>
    <field name="nb_col" labelOnTop="0"/>
    <field name="nb_lign" labelOnTop="0"/>
    <field name="notes" labelOnTop="0"/>
    <field name="pas_geom" labelOnTop="0"/>
    <field name="peinture" labelOnTop="0"/>
    <field name="prof" labelOnTop="0"/>
    <field name="regist" labelOnTop="0"/>
    <field name="selection" labelOnTop="0"/>
    <field name="sens" labelOnTop="0"/>
    <field name="simplify" labelOnTop="0"/>
    <field name="site" labelOnTop="0"/>
    <field name="structure" labelOnTop="0"/>
    <field name="sym_h" labelOnTop="0"/>
    <field name="taq" labelOnTop="0"/>
    <field name="taq_cul" labelOnTop="0"/>
    <field name="technologie" labelOnTop="0"/>
    <field name="tp_taq_dat" labelOnTop="0"/>
    <field name="tpq" labelOnTop="0"/>
    <field name="tpq_cul" labelOnTop="0"/>
    <field name="type" labelOnTop="0"/>
    <field name="type_eng" labelOnTop="0"/>
    <field name="x" labelOnTop="0"/>
    <field name="y" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>COALESCE("id", '&lt;NULL>')</previewExpression>
  <mapTip>&lt;div style="width:170;height:140">
&lt;style>
td { 
        font-size: 10px;
        }
&lt;/style>

&lt;table>
  &lt;tr>
    &lt;td>&lt;b> [%'type : '%] &lt;/b> [% "type" %] &lt;/td>
    &lt;td rowspan="8">&lt;img src="[% concat('file:///D:\\Projet Art Rupestre\\decors\\ug\\signes\\', "type" ,'.jpg') %]" width=45 />&lt;/td>
  &lt;/tr>
  &lt;tr>
    &lt;td>&lt;b> [%'chr_1 : '%] &lt;/b> [% "chr_1" %] &lt;/td>
  &lt;/tr>
  &lt;tr>
    &lt;td>&lt;b> [%'sens : '%] &lt;/b> [% CASE WHEN "sens" IS NULL THEN 'x' ELSE "sens" END %] &lt;/td>
  &lt;/tr>
  &lt;tr>
    &lt;td>&lt;b> [%'dim° rel: '%] &lt;/b> [% CASE WHEN "long" IS NULL THEN 'x' ELSE "long" END %]  [%'*'%] [% CASE WHEN "larg" IS NULL THEN 'x' ELSE "larg" END %] &lt;/td>
  &lt;/tr>
    &lt;tr>
    &lt;td>&lt;b> [%' ------  cm: '%] &lt;/b> [% CASE WHEN "long_cm" IS NULL THEN 'x' ELSE "long_cm" END %]  [%'*'%] [% CASE WHEN "larg_cm" IS NULL THEN 'x' ELSE "larg_cm" END %]  &lt;/td>
  &lt;/tr>&#xd;
   &lt;tr>&#xd;
    &lt;td>&lt;b> [%' ------  gr_dim: '%] &lt;/b> [% CASE WHEN "gr_dim" IS NULL THEN 'x' ELSE "gr_dim" END %]  &lt;/td>&#xd;
  &lt;/tr>
    &lt;tr>
    &lt;td>&lt;b> [%'matr (c*l): '%] &lt;/b> [% CASE WHEN "nb_col" IS NULL THEN 'x' ELSE "nb_col" END %] [%'*'%] [% CASE WHEN "nb_lign" IS NULL THEN 'x' ELSE "nb_lign" END %]&lt;/td>
  &lt;/tr>
    &lt;tr>
    &lt;td>&lt;b> [%'auto : '%] &lt;/b> [% CASE WHEN "auto" IS NULL THEN 'x' ELSE "auto" END %] &lt;/td>
  &lt;/tr>
&lt;/table>
&lt;/div></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
