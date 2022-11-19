<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyLocal="1" readOnly="0" simplifyDrawingHints="0" styleCategories="AllStyleCategories" simplifyAlgorithm="0" labelsEnabled="1" hasScaleBasedVisibilityFlag="0" minScale="0" maxScale="0" simplifyDrawingTol="1" version="3.10.9-A Coruña" simplifyMaxScale="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 enableorderby="0" symbollevels="0" forceraster="0" type="RuleRenderer">
    <rules key="{9b549ecf-d391-4336-8bc3-9ebdad235292}">
      <rule key="{b0708ec7-c5f8-4b2b-8074-318a01083e21}" filter=" &quot;type&quot; &lt;> '_na' AND &quot;incomplet&quot; &lt;> 1" label="unite complete" symbol="0"/>
      <rule checkstate="0" key="{975f1e6f-82f6-4814-9093-b4ca282ca488}" filter=" &quot;type&quot; &lt;> '_na' AND &quot;incomplet&quot; = 1" label="unite incomplete" symbol="1"/>
      <rule checkstate="0" key="{62344f94-3e41-4d50-aa12-39a4f9dfb05b}" filter=" &quot;type&quot; = '_na'" label="partie manquante (_na)" symbol="2"/>
    </rules>
    <symbols>
      <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="0">
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <prop v="90" k="angle"/>
          <prop v="255,129,0,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="255,129,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="2" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="1">
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <prop v="90" k="angle"/>
          <prop v="239,19,0,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="semi_circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="2" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="2">
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <prop v="0" k="angle"/>
          <prop v="156,156,156,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="2" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="{4e9f21ea-64f0-4295-aa9e-cc4232a617c3}">
      <rule key="{5650deb4-65ef-4a06-9c23-06f2b66d2ec7}" description="id">
        <settings calloutType="simple">
          <text-style fontSize="11" fieldName="id" fontKerning="1" fontLetterSpacing="0" fontStrikeout="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontItalic="0" multilineHeight="1" textColor="255,129,0,255" fontSizeUnit="Point" fontWeight="75" textOrientation="horizontal" textOpacity="1" blendMode="0" namedStyle="Bold" isExpression="0" fontWordSpacing="0" fontUnderline="0" useSubstitutions="0" fontCapitals="0" previewBkgrdColor="255,255,255,255" fontFamily="MS Shell Dlg 2">
            <text-buffer bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferJoinStyle="128" bufferNoFill="0" bufferSize="1" bufferBlendMode="0" bufferDraw="1" bufferOpacity="1" bufferSizeUnits="MM"/>
            <background shapeFillColor="255,255,255,255" shapeSizeX="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeBorderColor="128,128,128,255" shapeBorderWidth="0" shapeOffsetUnit="MM" shapeOffsetX="0" shapeOffsetY="0" shapeSVGFile="" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBlendMode="0" shapeOpacity="1" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeSizeType="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRotationType="0" shapeRotation="0" shapeDraw="0" shapeRadiiUnit="MM" shapeSizeY="0" shapeBorderWidthUnit="MM" shapeJoinStyle="64" shapeType="0" shapeSizeUnit="MM" shapeRadiiX="0">
              <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="markerSymbol">
                <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
                  <prop v="0" k="angle"/>
                  <prop v="141,90,153,255" k="color"/>
                  <prop v="1" k="horizontal_anchor_point"/>
                  <prop v="bevel" k="joinstyle"/>
                  <prop v="circle" k="name"/>
                  <prop v="0,0" k="offset"/>
                  <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
                  <prop v="MM" k="offset_unit"/>
                  <prop v="35,35,35,255" k="outline_color"/>
                  <prop v="solid" k="outline_style"/>
                  <prop v="0" k="outline_width"/>
                  <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
                  <prop v="MM" k="outline_width_unit"/>
                  <prop v="diameter" k="scale_method"/>
                  <prop v="2" k="size"/>
                  <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
                  <prop v="MM" k="size_unit"/>
                  <prop v="1" k="vertical_anchor_point"/>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option value="" type="QString" name="name"/>
                      <Option name="properties"/>
                      <Option value="collection" type="QString" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowOffsetUnit="MM" shadowScale="100" shadowDraw="0" shadowBlendMode="6" shadowOffsetDist="1" shadowOffsetAngle="135" shadowOffsetGlobal="1" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowOpacity="0.7" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadius="1.5" shadowRadiusAlphaOnly="0" shadowColor="0,0,0,255" shadowUnder="0"/>
            <dd_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format useMaxLineLengthForAutoWrap="1" leftDirectionSymbol="&lt;" decimals="3" multilineAlign="3" placeDirectionSymbol="0" wrapChar="" formatNumbers="0" autoWrapLength="0" plussign="0" rightDirectionSymbol=">" reverseDirectionSymbol="0" addDirectionSymbol="0"/>
          <placement rotationAngle="0" centroidInside="0" repeatDistanceUnits="MM" placement="1" repeatDistance="0" maxCurvedCharAngleOut="-25" quadOffset="1" fitInPolygonOnly="0" centroidWhole="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" xOffset="0" offsetType="0" maxCurvedCharAngleIn="25" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" dist="0" geometryGenerator="" overrunDistanceUnit="MM" geometryGeneratorType="PointGeometry" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" preserveRotation="1" placementFlags="10" overrunDistance="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorEnabled="0" distUnits="MM" distMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MapUnit" priority="5" layerType="PointGeometry" yOffset="-1"/>
          <rendering fontMinPixelSize="3" scaleMax="10000000" fontLimitPixelSize="0" maxNumLabels="2000" displayAll="1" minFeatureSize="0" labelPerPart="0" obstacle="1" obstacleType="0" drawLabels="1" zIndex="0" obstacleFactor="1" limitNumLabels="0" mergeLines="0" scaleMin="1" upsidedownLabels="0" fontMaxPixelSize="10000" scaleVisibility="0"/>
          <dd_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option value="pole_of_inaccessibility" type="QString" name="anchorPoint"/>
              <Option type="Map" name="ddProperties">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
              <Option value="false" type="bool" name="drawToAllParts"/>
              <Option value="0" type="QString" name="enabled"/>
              <Option value="&lt;symbol force_rhr=&quot;0&quot; clip_to_extent=&quot;1&quot; alpha=&quot;1&quot; type=&quot;line&quot; name=&quot;symbol&quot;>&lt;layer class=&quot;SimpleLine&quot; enabled=&quot;1&quot; pass=&quot;0&quot; locked=&quot;0&quot;>&lt;prop v=&quot;square&quot; k=&quot;capstyle&quot;/>&lt;prop v=&quot;5;2&quot; k=&quot;customdash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;customdash_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;customdash_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;draw_inside_polygon&quot;/>&lt;prop v=&quot;bevel&quot; k=&quot;joinstyle&quot;/>&lt;prop v=&quot;60,60,60,255&quot; k=&quot;line_color&quot;/>&lt;prop v=&quot;solid&quot; k=&quot;line_style&quot;/>&lt;prop v=&quot;0.3&quot; k=&quot;line_width&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;line_width_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;offset&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;offset_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;offset_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;ring_filter&quot;/>&lt;prop v=&quot;0&quot; k=&quot;use_custom_dash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;width_map_unit_scale&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString" name="lineSymbol"/>
              <Option value="0" type="double" name="minLength"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="minLengthMapUnitScale"/>
              <Option value="MM" type="QString" name="minLengthUnit"/>
              <Option value="0" type="double" name="offsetFromAnchor"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromAnchorMapUnitScale"/>
              <Option value="MM" type="QString" name="offsetFromAnchorUnit"/>
              <Option value="0" type="double" name="offsetFromLabel"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromLabelMapUnitScale"/>
              <Option value="MM" type="QString" name="offsetFromLabelUnit"/>
            </Option>
          </callout>
        </settings>
      </rule>
      <rule key="{8516c43d-81e6-4485-8cfc-c224ee4f6a0e}" active="0" description="type">
        <settings calloutType="simple">
          <text-style fontSize="11" fieldName="type" fontKerning="1" fontLetterSpacing="0" fontStrikeout="0" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontItalic="0" multilineHeight="1" textColor="255,129,0,255" fontSizeUnit="Point" fontWeight="50" textOrientation="horizontal" textOpacity="1" blendMode="0" namedStyle="Regular" isExpression="0" fontWordSpacing="0" fontUnderline="0" useSubstitutions="0" fontCapitals="0" previewBkgrdColor="255,255,255,255" fontFamily="MS Shell Dlg 2">
            <text-buffer bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferJoinStyle="128" bufferNoFill="0" bufferSize="1.5" bufferBlendMode="0" bufferDraw="1" bufferOpacity="1" bufferSizeUnits="MM"/>
            <background shapeFillColor="255,255,255,255" shapeSizeX="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeBorderColor="128,128,128,255" shapeBorderWidth="0" shapeOffsetUnit="MM" shapeOffsetX="0" shapeOffsetY="0" shapeSVGFile="" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBlendMode="0" shapeOpacity="1" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeSizeType="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRotationType="0" shapeRotation="0" shapeDraw="0" shapeRadiiUnit="MM" shapeSizeY="0" shapeBorderWidthUnit="MM" shapeJoinStyle="64" shapeType="0" shapeSizeUnit="MM" shapeRadiiX="0">
              <symbol force_rhr="0" clip_to_extent="1" alpha="1" type="marker" name="markerSymbol">
                <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
                  <prop v="0" k="angle"/>
                  <prop v="232,113,141,255" k="color"/>
                  <prop v="1" k="horizontal_anchor_point"/>
                  <prop v="bevel" k="joinstyle"/>
                  <prop v="circle" k="name"/>
                  <prop v="0,0" k="offset"/>
                  <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
                  <prop v="MM" k="offset_unit"/>
                  <prop v="35,35,35,255" k="outline_color"/>
                  <prop v="solid" k="outline_style"/>
                  <prop v="0" k="outline_width"/>
                  <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
                  <prop v="MM" k="outline_width_unit"/>
                  <prop v="diameter" k="scale_method"/>
                  <prop v="2" k="size"/>
                  <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
                  <prop v="MM" k="size_unit"/>
                  <prop v="1" k="vertical_anchor_point"/>
                  <data_defined_properties>
                    <Option type="Map">
                      <Option value="" type="QString" name="name"/>
                      <Option name="properties"/>
                      <Option value="collection" type="QString" name="type"/>
                    </Option>
                  </data_defined_properties>
                </layer>
              </symbol>
            </background>
            <shadow shadowOffsetUnit="MM" shadowScale="100" shadowDraw="0" shadowBlendMode="6" shadowOffsetDist="1" shadowOffsetAngle="135" shadowOffsetGlobal="1" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowOpacity="0.7" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadius="1.5" shadowRadiusAlphaOnly="0" shadowColor="0,0,0,255" shadowUnder="0"/>
            <dd_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format useMaxLineLengthForAutoWrap="1" leftDirectionSymbol="&lt;" decimals="3" multilineAlign="3" placeDirectionSymbol="0" wrapChar="" formatNumbers="0" autoWrapLength="0" plussign="0" rightDirectionSymbol=">" reverseDirectionSymbol="0" addDirectionSymbol="0"/>
          <placement rotationAngle="0" centroidInside="0" repeatDistanceUnits="MM" placement="1" repeatDistance="0" maxCurvedCharAngleOut="-25" quadOffset="2" fitInPolygonOnly="0" centroidWhole="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" xOffset="0" offsetType="0" maxCurvedCharAngleIn="25" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" dist="0" geometryGenerator="" overrunDistanceUnit="MM" geometryGeneratorType="PointGeometry" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" preserveRotation="1" placementFlags="10" overrunDistance="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorEnabled="0" distUnits="MM" distMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MapUnit" priority="5" layerType="PointGeometry" yOffset="1"/>
          <rendering fontMinPixelSize="3" scaleMax="10000000" fontLimitPixelSize="0" maxNumLabels="2000" displayAll="1" minFeatureSize="0" labelPerPart="0" obstacle="1" obstacleType="0" drawLabels="1" zIndex="0" obstacleFactor="1" limitNumLabels="0" mergeLines="0" scaleMin="1" upsidedownLabels="0" fontMaxPixelSize="10000" scaleVisibility="0"/>
          <dd_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option value="pole_of_inaccessibility" type="QString" name="anchorPoint"/>
              <Option type="Map" name="ddProperties">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
              <Option value="false" type="bool" name="drawToAllParts"/>
              <Option value="0" type="QString" name="enabled"/>
              <Option value="&lt;symbol force_rhr=&quot;0&quot; clip_to_extent=&quot;1&quot; alpha=&quot;1&quot; type=&quot;line&quot; name=&quot;symbol&quot;>&lt;layer class=&quot;SimpleLine&quot; enabled=&quot;1&quot; pass=&quot;0&quot; locked=&quot;0&quot;>&lt;prop v=&quot;square&quot; k=&quot;capstyle&quot;/>&lt;prop v=&quot;5;2&quot; k=&quot;customdash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;customdash_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;customdash_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;draw_inside_polygon&quot;/>&lt;prop v=&quot;bevel&quot; k=&quot;joinstyle&quot;/>&lt;prop v=&quot;60,60,60,255&quot; k=&quot;line_color&quot;/>&lt;prop v=&quot;solid&quot; k=&quot;line_style&quot;/>&lt;prop v=&quot;0.3&quot; k=&quot;line_width&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;line_width_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;offset&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;offset_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;offset_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;ring_filter&quot;/>&lt;prop v=&quot;0&quot; k=&quot;use_custom_dash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;width_map_unit_scale&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString" name="lineSymbol"/>
              <Option value="0" type="double" name="minLength"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="minLengthMapUnitScale"/>
              <Option value="MM" type="QString" name="minLengthUnit"/>
              <Option value="0" type="double" name="offsetFromAnchor"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromAnchorMapUnitScale"/>
              <Option value="MM" type="QString" name="offsetFromAnchorUnit"/>
              <Option value="0" type="double" name="offsetFromLabel"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromLabelMapUnitScale"/>
              <Option value="MM" type="QString" name="offsetFromLabelUnit"/>
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
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Pie">
    <DiagramCategory barWidth="5" penWidth="0" maxScaleDenominator="1e+08" minimumSize="0" height="15" sizeScale="3x:0,0,0,0,0,0" scaleBasedVisibility="0" scaleDependency="Area" opacity="1" minScaleDenominator="0" backgroundColor="#ffffff" width="15" penColor="#000000" sizeType="MM" backgroundAlpha="255" labelPlacementMethod="XHeight" penAlpha="255" lineSizeType="MM" lineSizeScale="3x:0,0,0,0,0,0" rotationOffset="0" enabled="0" diagramOrientation="Up">
      <fontProperties style="" description="MS Shell Dlg 2,7.5,-1,5,50,0,0,0,0,0"/>
      <attribute field="" label="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings priority="0" linePlacementFlags="2" zIndex="0" dist="0" placement="0" showAll="1" obstacle="0">
    <properties>
      <Option type="Map">
        <Option value="" type="QString" name="name"/>
        <Option type="Map" name="properties">
          <Option type="Map" name="positionX">
            <Option value="true" type="bool" name="active"/>
            <Option value="decor" type="QString" name="field"/>
            <Option value="2" type="int" name="type"/>
          </Option>
          <Option type="Map" name="positionY">
            <Option value="true" type="bool" name="active"/>
            <Option value="decor" type="QString" name="field"/>
            <Option value="2" type="int" name="type"/>
          </Option>
          <Option type="Map" name="show">
            <Option value="true" type="bool" name="active"/>
            <Option value="decor" type="QString" name="field"/>
            <Option value="2" type="int" name="type"/>
          </Option>
        </Option>
        <Option value="collection" type="QString" name="type"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="decor">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="id">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="type">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="type" type="QString" name="Key"/>
            <Option value="typo_ug20170618110741000" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="type" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="auto">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sym_h">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nb_lign">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nb_col">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="incomplet">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="1" type="QString" name="CheckedState"/>
            <Option value="0" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="info_mq">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="1" type="QString" name="CheckedState"/>
            <Option value="0" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="continu">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="1" type="QString" name="CheckedState"/>
            <Option value="0" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sens">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="famille">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="AllowMulti"/>
            <Option value="0" type="QString" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="famille" type="QString" name="Key"/>
            <Option value="famille20200416222028031" type="QString" name="Layer"/>
            <Option value="0" type="QString" name="OrderByValue"/>
            <Option value="0" type="QString" name="UseCompleter"/>
            <Option value="famille" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="prof">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="notes">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="regist">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="x">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="y">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="site">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="structure">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="pas_geom">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="gravure">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="peinture">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="technologie">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="AllowMulti"/>
            <Option value="0" type="QString" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="type" type="QString" name="Key"/>
            <Option value="techno_ug20170902221328512" type="QString" name="Layer"/>
            <Option value="0" type="QString" name="OrderByValue"/>
            <Option value="0" type="QString" name="UseCompleter"/>
            <Option value="type" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="a_fa">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="chr_1">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="chr_1" type="QString" name="Key"/>
            <Option value="chrono20170919110606789" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="chr_1" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="chr_2">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="chr_3">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="chr_4">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="chr_5">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="chr_6">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="chr_7">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geom_obj">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="tpq_cul">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="AllowMulti"/>
            <Option value="0" type="QString" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="chr_1" type="QString" name="Key"/>
            <Option value="chrono20170919110606789" type="QString" name="Layer"/>
            <Option value="0" type="QString" name="OrderByValue"/>
            <Option value="0" type="QString" name="UseCompleter"/>
            <Option value="chr_1" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="taq_cul">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="AllowMulti"/>
            <Option value="0" type="QString" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="chr_1" type="QString" name="Key"/>
            <Option value="chrono20170919110606789" type="QString" name="Layer"/>
            <Option value="0" type="QString" name="OrderByValue"/>
            <Option value="0" type="QString" name="UseCompleter"/>
            <Option value="chr_1" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="tp_taq_dat">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="1" type="QString" name="CheckedState"/>
            <Option value="0" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="tpq">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="taq">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="selection">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="1" type="QString" name="CheckedState"/>
            <Option value="0" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geom_shape">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="aire">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="simplify">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geom_contour">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geom_mbc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bib">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fonction">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="AllowMulti"/>
            <Option value="0" type="QString" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="fonction" type="QString" name="Key"/>
            <Option value="fonctions20200416222339494" type="QString" name="Layer"/>
            <Option value="0" type="QString" name="OrderByValue"/>
            <Option value="0" type="QString" name="UseCompleter"/>
            <Option value="fonction" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="type_eng">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="long">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="larg">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="dim_notes">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="dim_is_abs">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="long_cm">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="larg_cm">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="gr_dim">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idf">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
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
    <alias field="decor" index="0" name=""/>
    <alias field="id" index="1" name=""/>
    <alias field="type" index="2" name=""/>
    <alias field="auto" index="3" name=""/>
    <alias field="sym_h" index="4" name=""/>
    <alias field="nb_lign" index="5" name=""/>
    <alias field="nb_col" index="6" name=""/>
    <alias field="incomplet" index="7" name=""/>
    <alias field="info_mq" index="8" name=""/>
    <alias field="continu" index="9" name=""/>
    <alias field="sens" index="10" name=""/>
    <alias field="famille" index="11" name=""/>
    <alias field="prof" index="12" name=""/>
    <alias field="notes" index="13" name=""/>
    <alias field="regist" index="14" name=""/>
    <alias field="x" index="15" name=""/>
    <alias field="y" index="16" name=""/>
    <alias field="site" index="17" name=""/>
    <alias field="structure" index="18" name=""/>
    <alias field="pas_geom" index="19" name=""/>
    <alias field="gravure" index="20" name=""/>
    <alias field="peinture" index="21" name=""/>
    <alias field="technologie" index="22" name=""/>
    <alias field="a_fa" index="23" name=""/>
    <alias field="chr_1" index="24" name=""/>
    <alias field="chr_2" index="25" name=""/>
    <alias field="chr_3" index="26" name=""/>
    <alias field="chr_4" index="27" name=""/>
    <alias field="chr_5" index="28" name=""/>
    <alias field="chr_6" index="29" name=""/>
    <alias field="chr_7" index="30" name=""/>
    <alias field="geom_obj" index="31" name=""/>
    <alias field="tpq_cul" index="32" name=""/>
    <alias field="taq_cul" index="33" name=""/>
    <alias field="tp_taq_dat" index="34" name=""/>
    <alias field="tpq" index="35" name=""/>
    <alias field="taq" index="36" name=""/>
    <alias field="selection" index="37" name=""/>
    <alias field="geom_shape" index="38" name=""/>
    <alias field="aire" index="39" name=""/>
    <alias field="simplify" index="40" name=""/>
    <alias field="geom_contour" index="41" name=""/>
    <alias field="geom_mbc" index="42" name=""/>
    <alias field="bib" index="43" name=""/>
    <alias field="fonction" index="44" name=""/>
    <alias field="type_eng" index="45" name=""/>
    <alias field="long" index="46" name=""/>
    <alias field="larg" index="47" name=""/>
    <alias field="dim_notes" index="48" name=""/>
    <alias field="dim_is_abs" index="49" name=""/>
    <alias field="long_cm" index="50" name=""/>
    <alias field="larg_cm" index="51" name=""/>
    <alias field="gr_dim" index="52" name=""/>
    <alias field="idf" index="53" name=""/>
    <alias field="aspect_techno" index="54" name=""/>
    <alias field="id_txt" index="55" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" field="decor" expression="regexp_replace( @project_filename,'.qgs','')"/>
    <default applyOnUpdate="0" field="id" expression="maximum(&quot;id&quot;)+1"/>
    <default applyOnUpdate="0" field="type" expression="'xxx'"/>
    <default applyOnUpdate="0" field="auto" expression=""/>
    <default applyOnUpdate="0" field="sym_h" expression=""/>
    <default applyOnUpdate="0" field="nb_lign" expression=""/>
    <default applyOnUpdate="0" field="nb_col" expression=""/>
    <default applyOnUpdate="0" field="incomplet" expression=""/>
    <default applyOnUpdate="0" field="info_mq" expression=""/>
    <default applyOnUpdate="0" field="continu" expression=""/>
    <default applyOnUpdate="0" field="sens" expression=""/>
    <default applyOnUpdate="0" field="famille" expression=""/>
    <default applyOnUpdate="0" field="prof" expression=""/>
    <default applyOnUpdate="0" field="notes" expression=""/>
    <default applyOnUpdate="0" field="regist" expression=""/>
    <default applyOnUpdate="0" field="x" expression=""/>
    <default applyOnUpdate="0" field="y" expression=""/>
    <default applyOnUpdate="0" field="site" expression="substr(@project_folder,13,999)"/>
    <default applyOnUpdate="0" field="structure" expression="xxx"/>
    <default applyOnUpdate="0" field="pas_geom" expression=""/>
    <default applyOnUpdate="0" field="gravure" expression=""/>
    <default applyOnUpdate="0" field="peinture" expression=""/>
    <default applyOnUpdate="0" field="technologie" expression=""/>
    <default applyOnUpdate="0" field="a_fa" expression=""/>
    <default applyOnUpdate="0" field="chr_1" expression="'xxx'"/>
    <default applyOnUpdate="0" field="chr_2" expression="'xxx'"/>
    <default applyOnUpdate="0" field="chr_3" expression="'xxx'"/>
    <default applyOnUpdate="0" field="chr_4" expression="'xxx'"/>
    <default applyOnUpdate="0" field="chr_5" expression="'xxx'"/>
    <default applyOnUpdate="0" field="chr_6" expression="'xxx'"/>
    <default applyOnUpdate="0" field="chr_7" expression="'xxx'"/>
    <default applyOnUpdate="0" field="geom_obj" expression=""/>
    <default applyOnUpdate="0" field="tpq_cul" expression="'xxx'"/>
    <default applyOnUpdate="0" field="taq_cul" expression="'xxx'"/>
    <default applyOnUpdate="0" field="tp_taq_dat" expression="0"/>
    <default applyOnUpdate="0" field="tpq" expression=""/>
    <default applyOnUpdate="0" field="taq" expression=""/>
    <default applyOnUpdate="0" field="selection" expression=""/>
    <default applyOnUpdate="0" field="geom_shape" expression=""/>
    <default applyOnUpdate="0" field="aire" expression=""/>
    <default applyOnUpdate="0" field="simplify" expression=""/>
    <default applyOnUpdate="0" field="geom_contour" expression=""/>
    <default applyOnUpdate="0" field="geom_mbc" expression=""/>
    <default applyOnUpdate="0" field="bib" expression=""/>
    <default applyOnUpdate="0" field="fonction" expression=""/>
    <default applyOnUpdate="0" field="type_eng" expression=""/>
    <default applyOnUpdate="0" field="long" expression=""/>
    <default applyOnUpdate="0" field="larg" expression=""/>
    <default applyOnUpdate="0" field="dim_notes" expression=""/>
    <default applyOnUpdate="0" field="dim_is_abs" expression=""/>
    <default applyOnUpdate="0" field="long_cm" expression=""/>
    <default applyOnUpdate="0" field="larg_cm" expression=""/>
    <default applyOnUpdate="0" field="gr_dim" expression=""/>
    <default applyOnUpdate="0" field="idf" expression=""/>
    <default applyOnUpdate="0" field="aspect_techno" expression=""/>
    <default applyOnUpdate="0" field="id_txt" expression=""/>
  </defaults>
  <constraints>
    <constraint unique_strength="0" field="decor" notnull_strength="1" constraints="1" exp_strength="0"/>
    <constraint unique_strength="0" field="id" notnull_strength="1" constraints="1" exp_strength="0"/>
    <constraint unique_strength="0" field="type" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="auto" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="sym_h" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="nb_lign" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="nb_col" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="incomplet" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="info_mq" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="continu" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="sens" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="famille" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="prof" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="notes" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="regist" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="x" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="y" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="site" notnull_strength="1" constraints="1" exp_strength="0"/>
    <constraint unique_strength="0" field="structure" notnull_strength="1" constraints="1" exp_strength="0"/>
    <constraint unique_strength="0" field="pas_geom" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="gravure" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="peinture" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="technologie" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="a_fa" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="chr_1" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="chr_2" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="chr_3" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="chr_4" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="chr_5" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="chr_6" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="chr_7" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="geom_obj" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="tpq_cul" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="taq_cul" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="tp_taq_dat" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="tpq" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="taq" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="selection" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="geom_shape" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="aire" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="simplify" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="geom_contour" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="geom_mbc" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="bib" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="fonction" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="type_eng" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="long" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="larg" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="dim_notes" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="dim_is_abs" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="long_cm" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="larg_cm" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="gr_dim" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="1" field="idf" notnull_strength="1" constraints="3" exp_strength="0"/>
    <constraint unique_strength="0" field="aspect_techno" notnull_strength="0" constraints="0" exp_strength="0"/>
    <constraint unique_strength="0" field="id_txt" notnull_strength="0" constraints="0" exp_strength="0"/>
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
    <defaultAction key="Canvas" value="{62e6dd72-028c-497e-a342-dfaf3783717c}"/>
    <actionsetting shortTitle="" isEnabledOnlyWhenEditable="0" icon="" action="" notificationMessage="" id="{d2a25f22-25fe-4386-83e4-067d0dcdf435}" capture="0" type="0" name="">
      <actionScope id="Canvas"/>
      <actionScope id="Field"/>
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting shortTitle="" isEnabledOnlyWhenEditable="0" icon="" action="[% @project_folder %]" notificationMessage="" id="{7a7381d7-f789-42a8-aa09-7cee540b3524}" capture="0" type="5" name="Ouvre le dossier de l'objet">
      <actionScope id="Canvas"/>
      <actionScope id="Field"/>
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting shortTitle="" isEnabledOnlyWhenEditable="0" icon="" action="[%concat(@project_folder,'/',@layer_name,'.csv' )%]" notificationMessage="" id="{fe4f62e3-9c74-44fe-857b-7b6dbf400805}" capture="0" type="5" name="Ouvre la liste des connexions">
      <actionScope id="Canvas"/>
      <actionScope id="Field"/>
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="&quot;ID&quot;" sortOrder="1">
    <columns>
      <column hidden="1" width="-1" type="actions"/>
      <column hidden="0" width="-1" type="field" name="decor"/>
      <column hidden="0" width="-1" type="field" name="id"/>
      <column hidden="0" width="-1" type="field" name="type"/>
      <column hidden="0" width="-1" type="field" name="sens"/>
      <column hidden="0" width="-1" type="field" name="long"/>
      <column hidden="0" width="-1" type="field" name="larg"/>
      <column hidden="0" width="-1" type="field" name="long_cm"/>
      <column hidden="0" width="-1" type="field" name="larg_cm"/>
      <column hidden="0" width="-1" type="field" name="gr_dim"/>
      <column hidden="0" width="-1" type="field" name="chr_1"/>
      <column hidden="0" width="-1" type="field" name="tpq_cul"/>
      <column hidden="0" width="-1" type="field" name="taq_cul"/>
      <column hidden="0" width="-1" type="field" name="tpq"/>
      <column hidden="0" width="-1" type="field" name="taq"/>
      <column hidden="0" width="-1" type="field" name="tp_taq_dat"/>
      <column hidden="0" width="-1" type="field" name="technologie"/>
      <column hidden="0" width="-1" type="field" name="incomplet"/>
      <column hidden="0" width="-1" type="field" name="auto"/>
      <column hidden="0" width="-1" type="field" name="sym_h"/>
      <column hidden="0" width="-1" type="field" name="nb_lign"/>
      <column hidden="0" width="-1" type="field" name="nb_col"/>
      <column hidden="0" width="-1" type="field" name="site"/>
      <column hidden="0" width="-1" type="field" name="structure"/>
      <column hidden="0" width="-1" type="field" name="bib"/>
      <column hidden="0" width="-1" type="field" name="info_mq"/>
      <column hidden="0" width="-1" type="field" name="continu"/>
      <column hidden="0" width="-1" type="field" name="famille"/>
      <column hidden="0" width="-1" type="field" name="prof"/>
      <column hidden="0" width="-1" type="field" name="notes"/>
      <column hidden="0" width="-1" type="field" name="regist"/>
      <column hidden="0" width="-1" type="field" name="x"/>
      <column hidden="0" width="-1" type="field" name="y"/>
      <column hidden="0" width="-1" type="field" name="idf"/>
      <column hidden="0" width="-1" type="field" name="pas_geom"/>
      <column hidden="0" width="-1" type="field" name="gravure"/>
      <column hidden="0" width="-1" type="field" name="peinture"/>
      <column hidden="0" width="-1" type="field" name="a_fa"/>
      <column hidden="0" width="-1" type="field" name="chr_2"/>
      <column hidden="0" width="-1" type="field" name="chr_3"/>
      <column hidden="0" width="-1" type="field" name="chr_4"/>
      <column hidden="0" width="-1" type="field" name="chr_5"/>
      <column hidden="0" width="-1" type="field" name="chr_6"/>
      <column hidden="0" width="-1" type="field" name="chr_7"/>
      <column hidden="0" width="-1" type="field" name="geom_obj"/>
      <column hidden="0" width="-1" type="field" name="selection"/>
      <column hidden="0" width="-1" type="field" name="geom_shape"/>
      <column hidden="0" width="-1" type="field" name="aire"/>
      <column hidden="0" width="-1" type="field" name="simplify"/>
      <column hidden="0" width="-1" type="field" name="geom_contour"/>
      <column hidden="0" width="-1" type="field" name="geom_mbc"/>
      <column hidden="0" width="-1" type="field" name="fonction"/>
      <column hidden="0" width="-1" type="field" name="type_eng"/>
      <column hidden="0" width="-1" type="field" name="dim_notes"/>
      <column hidden="0" width="-1" type="field" name="dim_is_abs"/>
      <column hidden="0" width="-1" type="field" name="aspect_techno"/>
      <column hidden="0" width="-1" type="field" name="id_txt"/>
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
    <attributeEditorContainer visibilityExpression="" columnCount="1" showLabel="1" groupBox="0" visibilityExpressionEnabled="0" name="unite">
      <attributeEditorField showLabel="1" index="1" name="id"/>
      <attributeEditorField showLabel="1" index="2" name="type"/>
      <attributeEditorField showLabel="1" index="10" name="sens"/>
      <attributeEditorContainer visibilityExpression="" columnCount="1" showLabel="1" groupBox="1" visibilityExpressionEnabled="0" name="dimensions">
        <attributeEditorContainer visibilityExpression="" columnCount="1" showLabel="1" groupBox="1" visibilityExpressionEnabled="0" name="pix and cm">
          <attributeEditorContainer visibilityExpression="" columnCount="2" showLabel="1" groupBox="1" visibilityExpressionEnabled="0" name="px">
            <attributeEditorField showLabel="1" index="46" name="long"/>
            <attributeEditorField showLabel="1" index="47" name="larg"/>
          </attributeEditorContainer>
          <attributeEditorContainer visibilityExpression="" columnCount="2" showLabel="1" groupBox="1" visibilityExpressionEnabled="0" name="cm">
            <attributeEditorField showLabel="1" index="50" name="long_cm"/>
            <attributeEditorField showLabel="1" index="51" name="larg_cm"/>
          </attributeEditorContainer>
          <attributeEditorField showLabel="1" index="52" name="gr_dim"/>
        </attributeEditorContainer>
        <attributeEditorContainer visibilityExpression="" columnCount="2" showLabel="1" groupBox="1" visibilityExpressionEnabled="0" name="notes">
          <attributeEditorField showLabel="1" index="49" name="dim_is_abs"/>
          <attributeEditorField showLabel="1" index="48" name="dim_notes"/>
        </attributeEditorContainer>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpression="" columnCount="3" showLabel="1" groupBox="1" visibilityExpressionEnabled="0" name="infos">
        <attributeEditorField showLabel="1" index="22" name="technologie"/>
        <attributeEditorField showLabel="1" index="4" name="sym_h"/>
        <attributeEditorField showLabel="1" index="7" name="incomplet"/>
        <attributeEditorField showLabel="1" index="8" name="info_mq"/>
        <attributeEditorField showLabel="1" index="9" name="continu"/>
        <attributeEditorField showLabel="1" index="19" name="pas_geom"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpression="" columnCount="3" showLabel="1" groupBox="1" visibilityExpressionEnabled="0" name="contexte">
        <attributeEditorField showLabel="1" index="17" name="site"/>
        <attributeEditorField showLabel="1" index="18" name="structure"/>
        <attributeEditorField showLabel="1" index="0" name="decor"/>
      </attributeEditorContainer>
      <attributeEditorField showLabel="1" index="13" name="notes"/>
    </attributeEditorContainer>
    <attributeEditorContainer visibilityExpression="" columnCount="1" showLabel="1" groupBox="0" visibilityExpressionEnabled="0" name="matrice">
      <attributeEditorField showLabel="1" index="3" name="auto"/>
      <attributeEditorField showLabel="1" index="5" name="nb_lign"/>
      <attributeEditorField showLabel="1" index="6" name="nb_col"/>
    </attributeEditorContainer>
    <attributeEditorContainer visibilityExpression="" columnCount="1" showLabel="1" groupBox="0" visibilityExpressionEnabled="0" name="chronologie">
      <attributeEditorField showLabel="1" index="24" name="chr_1"/>
      <attributeEditorField showLabel="1" index="25" name="chr_2"/>
      <attributeEditorField showLabel="1" index="26" name="chr_3"/>
      <attributeEditorField showLabel="1" index="27" name="chr_4"/>
      <attributeEditorField showLabel="1" index="28" name="chr_5"/>
      <attributeEditorField showLabel="1" index="29" name="chr_6"/>
      <attributeEditorField showLabel="1" index="30" name="chr_7"/>
      <attributeEditorField showLabel="1" index="32" name="tpq_cul"/>
      <attributeEditorField showLabel="1" index="33" name="taq_cul"/>
      <attributeEditorField showLabel="1" index="35" name="tpq"/>
      <attributeEditorField showLabel="1" index="36" name="taq"/>
      <attributeEditorField showLabel="1" index="34" name="tp_taq_dat"/>
    </attributeEditorContainer>
    <attributeEditorContainer visibilityExpression="" columnCount="1" showLabel="1" groupBox="0" visibilityExpressionEnabled="0" name="calcul">
      <attributeEditorField showLabel="1" index="11" name="famille"/>
      <attributeEditorField showLabel="1" index="12" name="prof"/>
      <attributeEditorField showLabel="1" index="14" name="regist"/>
      <attributeEditorField showLabel="1" index="-1" name="epaule_milieu"/>
      <attributeEditorField showLabel="1" index="-1" name="carene_milieu"/>
      <attributeEditorField showLabel="1" index="-1" name="epaule_haut"/>
      <attributeEditorField showLabel="1" index="-1" name="carene_haut"/>
      <attributeEditorField showLabel="1" index="-1" name="epaule_bas"/>
      <attributeEditorField showLabel="1" index="-1" name="carene_bas"/>
      <attributeEditorField showLabel="1" index="15" name="x"/>
      <attributeEditorField showLabel="1" index="16" name="y"/>
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
    <field labelOnTop="0" name="a_fa"/>
    <field labelOnTop="0" name="aire"/>
    <field labelOnTop="0" name="aspect_techno"/>
    <field labelOnTop="0" name="auto"/>
    <field labelOnTop="0" name="bib"/>
    <field labelOnTop="0" name="chr_1"/>
    <field labelOnTop="0" name="chr_2"/>
    <field labelOnTop="0" name="chr_3"/>
    <field labelOnTop="0" name="chr_4"/>
    <field labelOnTop="0" name="chr_5"/>
    <field labelOnTop="0" name="chr_6"/>
    <field labelOnTop="0" name="chr_7"/>
    <field labelOnTop="0" name="continu"/>
    <field labelOnTop="0" name="decor"/>
    <field labelOnTop="0" name="dim_is_abs"/>
    <field labelOnTop="0" name="dim_notes"/>
    <field labelOnTop="0" name="famille"/>
    <field labelOnTop="0" name="fonction"/>
    <field labelOnTop="0" name="geom_contour"/>
    <field labelOnTop="0" name="geom_mbc"/>
    <field labelOnTop="0" name="geom_obj"/>
    <field labelOnTop="0" name="geom_shape"/>
    <field labelOnTop="0" name="gr_dim"/>
    <field labelOnTop="0" name="gravure"/>
    <field labelOnTop="0" name="id"/>
    <field labelOnTop="0" name="id_txt"/>
    <field labelOnTop="0" name="idf"/>
    <field labelOnTop="0" name="incomplet"/>
    <field labelOnTop="0" name="info_mq"/>
    <field labelOnTop="0" name="larg"/>
    <field labelOnTop="0" name="larg_cm"/>
    <field labelOnTop="0" name="long"/>
    <field labelOnTop="0" name="long_cm"/>
    <field labelOnTop="0" name="nb_col"/>
    <field labelOnTop="0" name="nb_lign"/>
    <field labelOnTop="0" name="notes"/>
    <field labelOnTop="0" name="pas_geom"/>
    <field labelOnTop="0" name="peinture"/>
    <field labelOnTop="0" name="prof"/>
    <field labelOnTop="0" name="regist"/>
    <field labelOnTop="0" name="selection"/>
    <field labelOnTop="0" name="sens"/>
    <field labelOnTop="0" name="simplify"/>
    <field labelOnTop="0" name="site"/>
    <field labelOnTop="0" name="structure"/>
    <field labelOnTop="0" name="sym_h"/>
    <field labelOnTop="0" name="taq"/>
    <field labelOnTop="0" name="taq_cul"/>
    <field labelOnTop="0" name="technologie"/>
    <field labelOnTop="0" name="tp_taq_dat"/>
    <field labelOnTop="0" name="tpq"/>
    <field labelOnTop="0" name="tpq_cul"/>
    <field labelOnTop="0" name="type"/>
    <field labelOnTop="0" name="type_eng"/>
    <field labelOnTop="0" name="x"/>
    <field labelOnTop="0" name="y"/>
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
